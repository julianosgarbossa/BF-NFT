//
//  ListOffersTableViewCell.swift
//  BF-NFT
//
//  Created by Juliano Sgarbossa on 14/09/26.
//

import UIKit
import AlamofireImage
import Alamofire

class ListOffersTableViewCell: UITableViewCell {

    static let identifier: String = String(describing: ListOffersTableViewCell.self)
    
    private lazy var screen: ListOffersTableViewCellScreen = {
        let screen = ListOffersTableViewCellScreen()
        screen.translatesAutoresizingMaskIntoConstraints = false
        screen.backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 26/255, alpha: 1)
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
            screen.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    func setupCell(latestDeal: LatestDeal, isInicial: Bool, isFinal: Bool) {
        if let url = URL(string: latestDeal.userImage) {
            screen.userImageView.af.setImage(withURL: url, placeholderImage: UIImage(systemName: "person.circle.fill")?.withTintColor(.black))
        }
        screen.nameUserLabel.text = latestDeal.userName
        screen.nftPriceLabel.text = "\(latestDeal.nftPrice) ETH"
        screen.lastVisualizationLabel.text = latestDeal.lastAccess
        
        if isInicial {
            screen.roundCorners(cornerRadiuns: 20, typeCorners: [.topLeft, .topRight])
        }
        
        if isFinal {
            screen.roundCorners(cornerRadiuns: 20, typeCorners: [.bottomLeft, .bottomRight])
        }
    }
}
