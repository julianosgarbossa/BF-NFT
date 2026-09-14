//
//  QuotationEthTableViewCell.swift
//  BF-NFT
//
//  Created by Juliano Sgarbossa on 14/09/26.
//

import UIKit

class QuotationEthTableViewCell: UITableViewCell {

    static let identifier: String = String(describing: QuotationEthTableViewCell.self)
    
    private lazy var screen: QuotationEthTableViewCellScreen = {
        let screen = QuotationEthTableViewCellScreen()
        screen.translatesAutoresizingMaskIntoConstraints = false
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
    
    func setupCell(quotationEthereum: QuotationEthereum) {
        screen.ethValueLabel.text = "\(quotationEthereum.ethValue) ETH"
        screen.ethValueInDollarsLabel.text = "$ \(quotationEthereum.valueInDollars)"
        screen.coinEthImageView.image = UIImage(named: quotationEthereum.coinEthImage)
    }
}
