//
//  LatestTransactionTableViewCellViewModel.swift
//  BF-NFT
//
//  Created by Juliano Sgarbossa on 14/09/26.
//

import Foundation

enum HeightLatestTransaction: CGFloat {
    case height = 70
}

final class LatestTransactionTableViewCellViewModel {
    private var latestTransactionCell: LatestTransactionsCell?
    
    var title: String {
        return latestTransactionCell?.latestTransactionsTitle ?? ""
    }
    
    var numberOfRowsInSection: Int {
        return latestTransactionCell?.listOfTransactions.count ?? 0
    }
    
    var heightForRowAt: CGFloat {
        return HeightLatestTransaction.height.rawValue
    }
    
    func setLatestTransaction(latestTransactionCell: LatestTransactionsCell) {
        self.latestTransactionCell = latestTransactionCell
    }
    
    func loadCurrentListOfTransaction(index: Int) -> ListOfTransaction {
        return latestTransactionCell?.listOfTransactions[index] ?? ListOfTransaction(type: "entry", idTransaction: "bnalsnlfn3216dfvcs154", image: "symbol.eth", priceEth: 1.2, valueDollar: 1393.49, dateAndHour: "10/07/2022 16:50")
    }
    
    func isInicial(index: Int) -> Bool {
        return index == 0
    }
    
    func isFinal(index: Int) -> Bool {
        return index == numberOfRowsInSection - 1
    }
}
