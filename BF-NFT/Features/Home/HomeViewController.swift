//
//  HomeViewController.swift
//  BF-NFT
//
//  Created by Juliano Sgarbossa on 11/09/26.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var screen: HomeScreen?
    private let viewModel: HomeViewModel = HomeViewModel()
    
    override func loadView() {
        screen = HomeScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigation()
        configProtocols()
        dismissKeyboard()
        viewModel.fetchRequest(typeFetch: .alamofire)
    }
    
    private func configNavigation() {
        navigationController?.navigationBar.isHidden = true
    }
    
    private func configProtocols() {
        screen?.configCollectionViewProtocols(delegate: self, dataSource: self)
        screen?.configTableViewProtocols(delegate: self, dataSource: self)
        screen?.configSearchBarDelegate(delegate: self)
        viewModel.delegate(delegate: self)
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.setFilter(indexPath: indexPath.item, searchText: screen?.searchBar.text ?? "")
        screen?.collectionView.reloadData()
        screen?.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        screen?.tableView.reloadData()
        if viewModel.numberOfRowsInSection > 0 {
            screen?.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
        }
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsInSection
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NftFilterCollectionViewCell.identifier, for: indexPath) as? NftFilterCollectionViewCell else { return UICollectionViewCell() }
        cell.setupCell(filterNft: viewModel.loadCurrentFilterNft(index: indexPath.item))
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return viewModel.sizeForItemAt
    }
}

extension HomeViewController: UITableViewDelegate {
    
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NftTableViewCell.identifier) as? NftTableViewCell else { return UITableViewCell() }
        cell.setupCell(nft: viewModel.loadCurrentNft(index: indexPath.row))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRowAt
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.filterSearchText(text: searchText)
        screen?.tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

extension HomeViewController: HomeViewModelDelegate {
    func success() {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            self.screen?.collectionView.reloadData()
            self.screen?.tableView.reloadData()
        }
    }
    
    func failure(failure: String) {
        showAlert(title: "Atenção", message: failure)
    }
}
