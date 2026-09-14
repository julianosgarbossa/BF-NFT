//
//  NftImageTableViewCell.swift
//  BF-NFT
//
//  Created by Juliano Sgarbossa on 14/09/26.
//

import UIKit
import AlamofireImage
import Alamofire

class NftImageTableViewCell: UITableViewCell {

    static let identifier: String = String(describing: NftImageTableViewCell.self)
    
    private lazy var screen: NftImageTableViewCellScreen = {
        let screen = NftImageTableViewCellScreen()
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
    
    func setupCell(urlImage: String, delegate: NftImageTableViewCellScreenDelegate) {
        if let url: URL = URL(string: urlImage) {
            screen.nftImageView.af.setImage(withURL: url)
        }
        screen.delegate(delegate: delegate)
    }
}
