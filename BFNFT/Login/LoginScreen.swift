//
//  LoginScreen.swift
//  BFNFT
//
//  Created by Juliano Sgarbossa on 29/09/25.
//

import UIKit

class LoginScreen: UIView {

    lazy var backgroundImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "BGLogin")
        return image
    }()
    
    lazy var logoAppImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "BFLogin")
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "BF NFT"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "O marketplace de NFTs da Backfront Academy"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .center
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = .white
        textField.attributedPlaceholder = NSAttributedString(string: "Login", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.4)])
        textField.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1)
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 8
        textField.clipsToBounds = true
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.white.cgColor
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.keyboardType = .emailAddress
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = .white
        textField.attributedPlaceholder = NSAttributedString(string: "Senha", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.4)])
        textField.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1)
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 8
        textField.clipsToBounds = true
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.white.cgColor
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.keyboardType = .default
        textField.isSecureTextEntry = true
        return textField
    }()
    
    lazy var recoverPasswordButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Recuperar senha?", for: .normal)
        button.setTitleColor(UIColor(red: 231/255, green: 48/255, blue: 214/255, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        button.addTarget(self, action: #selector(tappedRecoverPasswordButton), for: .touchUpInside)
        return button
    }()
    
    lazy var backgroundButtonImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Gradient")
        image.clipsToBounds = true
        image.layer.cornerRadius = 8
        image.contentMode = .scaleToFill
        return image
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Entrar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
        return button
    }()
    
    lazy var lineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var signInMetaMaskView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.layer.borderColor = UIColor(red: 207/255, green: 0/255, blue: 192/255, alpha: 1).cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    lazy var metamaskLeftLogoImageView: UIView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Logo")
        return image
    }()
    
    lazy var metamaskRightLogoImageView: UIView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Logo")
        return image
    }()
    
    lazy var loginMetaMarkButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Entrar Com a Metamask", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(tappedLoginMetaMaskButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedRecoverPasswordButton(_ sender: UIButton) {
        print(#function)
    }
    
    @objc func tappedLoginButton(_ sender: UIButton) {
        print(#function)
    }
    
    @objc func tappedLoginMetaMaskButton(_ sender: UIButton) {
        print(#function)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setVisualElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setVisualElements() {
        addSubview(backgroundImageView)
        addSubview(logoAppImageView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(recoverPasswordButton)
        addSubview(backgroundButtonImageView)
        addSubview(loginButton)
        addSubview(lineView)
        addSubview(signInMetaMaskView)
        addSubview(metamaskLeftLogoImageView)
        addSubview(metamaskRightLogoImageView)
        addSubview(loginMetaMarkButton)
        
        self.setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            logoAppImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            logoAppImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoAppImageView.heightAnchor.constraint(equalToConstant: 110),
            logoAppImageView.widthAnchor.constraint(equalToConstant: 110),
            
            titleLabel.topAnchor.constraint(equalTo: logoAppImageView.bottomAnchor, constant: 15),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            
            emailTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 30),
            emailTextField.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
            passwordTextField.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            recoverPasswordButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10),
            recoverPasswordButton.trailingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor),
            recoverPasswordButton.heightAnchor.constraint(equalToConstant: 15),
            
            backgroundButtonImageView.topAnchor.constraint(equalTo: recoverPasswordButton.bottomAnchor, constant: 35),
            backgroundButtonImageView.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor),
            backgroundButtonImageView.trailingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor),
            backgroundButtonImageView.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            loginButton.topAnchor.constraint(equalTo: backgroundButtonImageView.topAnchor),
            loginButton.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor),
            loginButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            lineView.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 50),
            lineView.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 75),
            lineView.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: -75),
            lineView.heightAnchor.constraint(equalToConstant: 0.5),
            
            signInMetaMaskView.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 50),
            signInMetaMaskView.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor),
            signInMetaMaskView.trailingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor),
            signInMetaMaskView.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            metamaskLeftLogoImageView.centerYAnchor.constraint(equalTo: signInMetaMaskView.centerYAnchor),
            metamaskLeftLogoImageView.leadingAnchor.constraint(equalTo: signInMetaMaskView.leadingAnchor, constant: 40),
            metamaskLeftLogoImageView.heightAnchor.constraint(equalToConstant: 20),
            metamaskLeftLogoImageView.widthAnchor.constraint(equalToConstant: 20),
            
            metamaskRightLogoImageView.centerYAnchor.constraint(equalTo: signInMetaMaskView.centerYAnchor),
            metamaskRightLogoImageView.trailingAnchor.constraint(equalTo: signInMetaMaskView.trailingAnchor, constant: -40),
            metamaskRightLogoImageView.heightAnchor.constraint(equalToConstant: 20),
            metamaskRightLogoImageView.widthAnchor.constraint(equalToConstant: 20),
            
            loginMetaMarkButton.topAnchor.constraint(equalTo: signInMetaMaskView.topAnchor),
            loginMetaMarkButton.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor),
            loginMetaMarkButton.trailingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor),
            loginMetaMarkButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
        ])
    }
}
