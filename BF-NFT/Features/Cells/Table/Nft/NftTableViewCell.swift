//
//  NftTableViewCell.swift
//  BF-NFT
//
//  Created by Juliano Sgarbossa on 11/09/26.
//

import UIKit
import Alamofire
import AlamofireImage

class NftTableViewCell: UITableViewCell {
    
    static let identifier: String = String(describing: NftTableViewCell.self)
    
    private lazy var screen: NftTableViewCellScreen = {
        let screen = NftTableViewCellScreen()
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
    
    func setupCell(nft: Nft) {
        if let urlNft: URL = URL(string: nft.nftImage),
           let urlUser: URL = URL(string: nft.userImage) {
            screen.nftImageView.af.setImage(withURL: urlNft, placeholderImage: UIImage(named: "three-buttons"))
            screen.nftImageView.backgroundColor = .white
            
            screen.userImageView.af.setImage(withURL: urlUser, placeholderImage: UIImage(systemName: "person.circle.fill"))
            screen.userImageView.backgroundColor = .white
        }
        screen.priceLabel.text = nft.price
        screen.priceValueLabel.text = "\(nft.nftPrice) ETH"
        screen.ownedByPriceLabel.text = nft.ownedBy
        screen.userLabel.text = nft.userName
    }
}
