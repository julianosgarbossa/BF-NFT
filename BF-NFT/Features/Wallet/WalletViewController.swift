//
//  WalletViewController.swift
//  BF-NFT
//
//  Created by Juliano Sgarbossa on 14/09/26.
//

import UIKit

enum WalletNameCell: Int {
    case quotationEth = 0
    case listOfTransaction = 1
}

class WalletViewController: UIViewController {
    
    private var screen: WalletScreen?
    private let viewModel: WalletViewModel = WalletViewModel()
    
    override func loadView() {
        screen = WalletScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigation()
        configProtocols()
        viewModel.fetchRequest(typeFetch: .alamofire)
    }
    
    private func configNavigation() {
        navigationController?.navigationBar.isHidden = true
    }
    
    private func configProtocols() {
        screen?.configTableViewProtocols(delegate: self, dataSource: self)
        viewModel.delegate(delegate: self)
    }
}

extension WalletViewController: UITableViewDelegate {
    
}

extension WalletViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch WalletNameCell(rawValue: indexPath.row) {
        case .quotationEth:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: QuotationEthTableViewCell.identifier, for: indexPath) as? QuotationEthTableViewCell else { return UITableViewCell() }
            cell.setupCell(quotationEthereum: viewModel.getQuotationEthereum)
            return cell
        case .listOfTransaction:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: LatestTransactionTableViewCell.identifier, for: indexPath) as? LatestTransactionTableViewCell else { return UITableViewCell() }
            cell.setupCell(latestTransactionCell: viewModel.getLatestTransaction)
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch WalletNameCell(rawValue: indexPath.row) {
        case .quotationEth:
            return 240
        case .listOfTransaction:
            return HeightLatestTransaction.height.rawValue * CGFloat(viewModel.getListOfTransactionCount) + 75
        default:
            return 0
        }
    }
}

extension WalletViewController: WalletViewModelDelegate {
    func success() {
        DispatchQueue.main.async { [weak self] in
            self?.screen?.tableView.reloadData()
        }
    }
    
    func failure(failure: String) {
        showAlert(title: "Atenção", message: failure)
    }
}
