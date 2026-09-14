//
//  NftDetailViewController.swift
//  BF-NFT
//
//  Created by Juliano Sgarbossa on 14/09/26.
//

import UIKit

enum NameCellNftDetail: Int {
    case nftImage = 0
    case nftDescription = 1
    case latestDeal = 2
}

class NftDetailViewController: UIViewController {
    
    private var screen: NftDetailScreen?
    private let viewModel: NftDetailViewModel
    
    override func loadView() {
        screen = NftDetailScreen()
        view = screen
    }
    
    required init(nft: Nft) {
        viewModel = NftDetailViewModel(nft: nft)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configProtocols()
    }
    
    private func configProtocols() {
        screen?.configTableViewProtocols(delegate: self, dataSource: self)
    }
}

extension NftDetailViewController: UITableViewDelegate {
    
}

extension NftDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch NameCellNftDetail(rawValue: indexPath.row) {
        case .nftImage:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: NftImageTableViewCell.identifier, for: indexPath) as? NftImageTableViewCell else { return UITableViewCell() }
            cell.setupCell(urlImage: viewModel.nftImage, delegate: self)
            return cell
        case .nftDescription:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: NftDescriptionTableViewCell.identifier, for: indexPath) as? NftDescriptionTableViewCell else { return UITableViewCell() }
            cell.setupCell(id: viewModel.nftId, title: viewModel.nftTitle, description: viewModel.nftDescription)
            return cell
        case .latestDeal:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: LatestDealTableViewCell.identifier, for: indexPath) as? LatestDealTableViewCell else { return UITableViewCell() }
            cell.setupCell(nft: viewModel.getNft)
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch NameCellNftDetail(rawValue: indexPath.row) {
        case .nftImage:
            return 400
        case .nftDescription:
            let textHeight = viewModel.nftDescription.height(withConstrainedWidth: tableView.bounds.width - 40, font: UIFont.systemFont(ofSize: 18))
            return textHeight + 89
        case .latestDeal:
            return HeightLatestDeal.height.rawValue * CGFloat(viewModel.getNft.latestDeals.count) + 75
        default:
            return 0
        }
    }
}

extension NftDetailViewController: NftImageTableViewCellScreenDelegate {
    func tappedCloseButton() {
        dismiss(animated: true)
    }
    
    func tappedMagnifyingGlassButton() {
        let magnifyingGlassViewController = MagnifyingGlassViewController(urlImage: viewModel.nftImage)
        magnifyingGlassViewController.modalPresentationStyle = .fullScreen
        present(magnifyingGlassViewController, animated: true)
    }
}
