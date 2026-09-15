//
//  ProfileTableViewCellScreen.swift
//  BF-NFT
//
//  Created by Juliano Sgarbossa on 14/09/26.
//

import UIKit

protocol ProfileTableViewCellScreenDelegate: AnyObject {
    func tappedLogoutButton()
}

class ProfileTableViewCellScreen: UIView {

    private weak var delegate: ProfileTableViewCellScreenDelegate?
    
    func delegate(delegate: ProfileTableViewCellScreenDelegate) {
        self.delegate = delegate
    }
    
    private lazy var userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "user")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 65
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.white.cgColor
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.text = "Juliano Sgarbossa"
        label.textAlignment = .left
        return label
    }()
    
    private lazy var profileAtLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 255/255, green: 152/255, blue: 255/255, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.text = "@julianosgarbossa"
        label.textAlignment = .left
        return label
    }()
    
    private lazy var logoutButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.setTitle("Fazer Logout", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.setTitleColor(UIColor(red: 207/255, green: 0/255, blue: 192/255, alpha: 1), for: .normal)
        button.layer.borderWidth = 1.7
        button.layer.borderColor = UIColor(red: 207/255, green: 0/255, blue: 192/255, alpha: 1).cgColor
        button.addTarget(self, action: #selector(tappedLogoutButton), for: .touchUpInside)
        return button
    }()
    
    @objc
    private func tappedLogoutButton(_ sender: UIButton) {
        delegate?.tappedLogoutButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addVisualElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addVisualElements() {
        backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 26/255, alpha: 1)
        
        addSubview(userImageView)
        addSubview(logoutButton)
        addSubview(nameLabel)
        addSubview(profileAtLabel)
        
        configConstraints()
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            userImageView.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            userImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            userImageView.heightAnchor.constraint(equalToConstant: 130),
            userImageView.widthAnchor.constraint(equalToConstant: 130),
            
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 75),
            nameLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            profileAtLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            profileAtLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            profileAtLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            
            logoutButton.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 40),
            logoutButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            logoutButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            logoutButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
}
