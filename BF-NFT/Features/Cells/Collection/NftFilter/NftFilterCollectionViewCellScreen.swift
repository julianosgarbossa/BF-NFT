//
//  NftFilterCollectionViewCellScreen.swift
//  BF-NFT
//
//  Created by Juliano Sgarbossa on 11/09/26.
//

import UIKit

class NftFilterCollectionViewCellScreen: UIView {
    
    lazy var filterLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1)
        label.clipsToBounds = true
        label.layer.cornerRadius = 18
        label.textAlignment = .center
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addVisualElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addVisualElements() {
        addSubview(filterLabel)
        
        configConstraints()
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            filterLabel.topAnchor.constraint(equalTo: topAnchor),
            filterLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            filterLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            filterLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
