//
//  WalletViewModel.swift
//  BF-NFT
//
//  Created by Juliano Sgarbossa on 14/09/26.
//

import Foundation

protocol WalletViewModelDelegate: AnyObject {
    func success()
    func failure(failure: String)
}

final class WalletViewModel {
    
    private weak var delegate: WalletViewModelDelegate?
    
    func delegate(delegate: WalletViewModelDelegate) {
        self.delegate = delegate
    }
    
    private let service: WalletService = WalletService()
    private var walletData: WalletData?
    
    func fetchRequest(typeFetch: TypeFetch) {
        switch typeFetch {
        case .mock:
            service.getWalletFromJson { [weak self] result, failure in
                if let result {
                    self?.walletData = result
                    self?.delegate?.success()
                } else {
                    self?.delegate?.failure(failure: failure?.localizedDescription ?? "")
                }
            }
        case .alamofire:
            service.getWalletFromAlamofire { [weak self] result, failure in
                if let result {
                    self?.walletData = result
                    self?.delegate?.success()
                } else {
                    self?.delegate?.failure(failure: failure?.localizedDescription ?? "")
                }
            }
        }
    }
    
    var numberOfRowsInSection: Int {
        return 2
    }
    
    var getQuotationEthereum: QuotationEthereum {
        return walletData?.quotationEthereum ?? QuotationEthereum(ethValue: 5.2, valueInDollars: 6036.32, coinEthImage: "coin.ethereum")
    }
    
    var getListOfTransactionCount: Int {
        return walletData?.latestTransactionsCell.listOfTransactions.count ?? 0
    }
    
    var getLatestTransaction: LatestTransactionsCell {
        return walletData?.latestTransactionsCell ?? LatestTransactionsCell(latestTransactionsTitle: "Últimas Transações", listOfTransactions: [ListOfTransaction(type: "entry", idTransaction: "bnalsnlfn3216dfvcs154", image: "symbol.eth", priceEth: 1.2, valueDollar: 1393.49, dateAndHour: "10/07/2022 16:50")])
    }
}
