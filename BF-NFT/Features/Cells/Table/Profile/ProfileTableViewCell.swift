//
//  ProfileTableViewCell.swift
//  BF-NFT
//
//  Created by Juliano Sgarbossa on 14/09/26.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    static let identifier: String = String(describing: ProfileTableViewCell.self)
    
    private lazy var screen: ProfileTableViewCellScreen = {
        let screen = ProfileTableViewCellScreen()
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
            screen.leadingAnchor.constraint(equalTo: leadingAnchor),
            screen.trailingAnchor.constraint(equalTo: trailingAnchor),
            screen.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    func setupCell(delegate: ProfileTableViewCellScreenDelegate) {
        screen.delegate(delegate: delegate)
    }
}
