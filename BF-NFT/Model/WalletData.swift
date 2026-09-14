//
//  WalletData.swift
//  BF-NFT
//
//  Created by Juliano Sgarbossa on 14/09/26.
//

import Foundation

struct WalletData: Codable {
    let quotationEthereum: QuotationEthereum
    let latestTransactionsCell: LatestTransactionsCell

    enum CodingKeys: String, CodingKey {
        case quotationEthereum = "quotation_ethereum"
        case latestTransactionsCell = "latest_transactions_cell"
    }
}

struct QuotationEthereum: Codable {
    let ethValue: Double
    let valueInDollars: Double
    let coinEthImage: String

    enum CodingKeys: String, CodingKey {
        case ethValue = "eth_value"
        case valueInDollars = "value_in_dollars"
        case coinEthImage = "coin_eth_image"
    }
}

struct LatestTransactionsCell: Codable {
    let latestTransactionsTitle: String
    let listOfTransactions: [ListOfTransaction]

    enum CodingKeys: String, CodingKey {
        case latestTransactionsTitle = "latest_transactions_title"
        case listOfTransactions = "list_of_transactions"
    }
}

struct ListOfTransaction: Codable {
    let type: String
    let idTransaction: String
    let image: String
    let priceEth: Double
    let valueDollar: Double
    let dateAndHour: String

    enum CodingKeys: String, CodingKey {
        case type
        case idTransaction = "id_transaction"
        case image
        case priceEth = "price_eth"
        case valueDollar = "value_dollar"
        case dateAndHour = "date_and_hour"
    }
}
