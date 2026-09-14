//
//  ListOfTransactionTableViewCell.swift
//  BF-NFT
//
//  Created by Juliano Sgarbossa on 14/09/26.
//

import UIKit

class ListOfTransactionTableViewCell: UITableViewCell {

    static let identifier: String = String(describing: ListOfTransactionTableViewCell.self)
    
    private lazy var screen: ListOfTransactionTableViewCellScreen = {
        let screen = ListOfTransactionTableViewCellScreen()
        screen.translatesAutoresizingMaskIntoConstraints = false
        screen.layer.borderColor = UIColor.white.cgColor
        screen.layer.borderWidth = 0.5
        return screen
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addVisualElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addVisualElements() {
        backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 26/255, alpha: 1)
        selectionStyle = .none
        
        contentView.addSubview(screen)
        
        configConstraints()
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            screen.topAnchor.constraint(equalTo: contentView.topAnchor),
            screen.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            screen.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            screen.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        resetCorners()
    }
    
    private func resetCorners() {
        screen.layer.cornerRadius = 0
        screen.layer.maskedCorners = []
        screen.clipsToBounds = false
    }
    
    func setupCell(listOfTransaction: ListOfTransaction, isInicial: Bool, isFinal: Bool) {
        resetCorners()
        
        screen.idTransactionLabel.text = listOfTransaction.idTransaction
        screen.transactionImageView.image = UIImage(named: listOfTransaction.image)
        screen.valueInDollarLabel.text = "$ \(listOfTransaction.valueDollar)"
        screen.dateEndHourLabel.text = listOfTransaction.dateAndHour
        
        if listOfTransaction.type == "exit" {
            screen.priceEthLabel.text = "-\(listOfTransaction.priceEth) ETH"
            screen.priceEthLabel.textColor = UIColor(red: 69/255, green: 191/255, blue: 229/255, alpha: 1)
            screen.valueInDollarLabel.textColor = UIColor(red: 122/255, green: 235/255, blue: 255/255, alpha: 1)
            screen.dateEndHourLabel.textColor = UIColor(red: 122/255, green: 235/255, blue: 255/255, alpha: 1)
        } else {
            screen.priceEthLabel.text = "+\(listOfTransaction.priceEth) ETH"
            screen.priceEthLabel.textColor = UIColor(red: 183/255, green: 0/255, blue: 170/255, alpha: 1)
            screen.valueInDollarLabel.textColor = UIColor(red: 255/255, green: 152/255, blue: 255/255, alpha: 1)
            screen.dateEndHourLabel.textColor = UIColor(red: 255/255, green: 152/255, blue: 255/255, alpha: 1)
        }
        
        if isInicial {
            screen.roundCorners(cornerRadiuns: 20, typeCorners: [.topLeft, .topRight])
        }
        
        if isFinal {
            screen.roundCorners(cornerRadiuns: 20, typeCorners: [.bottomLeft, .bottomRight])
        }
    }
}
