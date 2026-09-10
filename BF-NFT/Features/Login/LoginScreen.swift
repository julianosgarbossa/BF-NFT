//
//  LoginScreen.swift
//  BF-NFT
//
//  Created by Juliano Sgarbossa on 10/09/26.
//

import UIKit

protocol LoginScreenDelegate: AnyObject {
    func tappedRecoveryPasswordButton()
    func tappedLoginButton()
    func tappedLoginMetamaskButton()
}

class LoginScreen: UIView {
    
    private weak var delegate: LoginScreenDelegate?
    
    func delegate(delegate: LoginScreenDelegate) {
        self.delegate = delegate
    }

    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "bg-login")
        return imageView
    }()
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "bf-login")
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "BF NFT"
        label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "O marketplace de NFTs da Backfront Academy"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(string: "Login", attributes: [.foregroundColor: UIColor.white.withAlphaComponent(0.4)])
        textField.textColor = .white
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.white.withAlphaComponent(0.4).cgColor
        textField.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1)
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(string: "Senha", attributes: [.foregroundColor: UIColor.white.withAlphaComponent(0.4)])
        textField.textColor = .white
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.white.withAlphaComponent(0.4).cgColor
        textField.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1)
        textField.borderStyle = .roundedRect
        textField.keyboardType = .default
        textField.isSecureTextEntry = true
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        return textField
    }()
    
    private lazy var recoveryPasswordButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Recuperar senha?", for: .normal)
        button.setTitleColor(UIColor(red: 231/255, green: 48/255, blue: 214/255, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.addTarget(self, action: #selector(tappedRecoveryPasswordButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var backgroundButtonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "gradient")
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Entrar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        button.clipsToBounds = true
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var lineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white.withAlphaComponent(0.4)
        return view
    }()
    
    private lazy var loginMetamaskBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 231/255, green: 48/255, blue: 214/255, alpha: 1).cgColor
        return view
    }()
    
    private lazy var loginMetamaskLeftLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "logo-metamask")
        return imageView
    }()
    
    private lazy var loginMetamaskRigthLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "logo-metamask")
        return imageView
    }()
    
    private lazy var loginMetamaskButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Entrar com a Metamask", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        button.clipsToBounds = true
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(tappedLoginMetamaskButton), for: .touchUpInside)
        return button
    }()
    
    @objc
    private func tappedRecoveryPasswordButton(_ sender: UIButton) {
        delegate?.tappedRecoveryPasswordButton()
    }
    
    @objc
    private func tappedLoginButton(_ sender: UIButton) {
        delegate?.tappedLoginButton()
    }
    
    @objc
    private func tappedLoginMetamaskButton(_ sender: UIButton) {
        delegate?.tappedLoginMetamaskButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addVisualElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addVisualElements() {
        addSubview(backgroundImageView)
        addSubview(logoImageView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(recoveryPasswordButton)
        addSubview(backgroundButtonImageView)
        addSubview(loginButton)
        addSubview(lineView)
        addSubview(loginMetamaskBackgroundView)
        loginMetamaskBackgroundView.addSubview(loginMetamaskLeftLogoImageView)
        loginMetamaskBackgroundView.addSubview(loginMetamaskRigthLogoImageView)
        addSubview(loginMetamaskButton)
        
        configConstraints()
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            logoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 108),
            logoImageView.heightAnchor.constraint(equalToConstant: 108),
            
            titleLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 16),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            emailTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 32),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            recoveryPasswordButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 9),
            recoveryPasswordButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            recoveryPasswordButton.heightAnchor.constraint(equalToConstant: 16),
            
            backgroundButtonImageView.topAnchor.constraint(equalTo: recoveryPasswordButton.bottomAnchor, constant: 36),
            backgroundButtonImageView.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            backgroundButtonImageView.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            backgroundButtonImageView.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            loginButton.topAnchor.constraint(equalTo: backgroundButtonImageView.topAnchor),
            loginButton.leadingAnchor.constraint(equalTo: backgroundButtonImageView.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: backgroundButtonImageView.trailingAnchor),
            loginButton.bottomAnchor.constraint(equalTo: backgroundButtonImageView.bottomAnchor),
            
            lineView.topAnchor.constraint(equalTo: backgroundButtonImageView.bottomAnchor, constant: 48),
            lineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 64),
            lineView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -64),
            lineView.heightAnchor.constraint(equalToConstant: 0.5),
            
            loginMetamaskBackgroundView.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 48),
            loginMetamaskBackgroundView.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            loginMetamaskBackgroundView.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            loginMetamaskBackgroundView.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            loginMetamaskLeftLogoImageView.centerYAnchor.constraint(equalTo: loginMetamaskBackgroundView.centerYAnchor),
            loginMetamaskLeftLogoImageView.leadingAnchor.constraint(equalTo: loginMetamaskBackgroundView.leadingAnchor, constant: 50),
            loginMetamaskLeftLogoImageView.widthAnchor.constraint(equalToConstant: 24),
            loginMetamaskLeftLogoImageView.heightAnchor.constraint(equalToConstant: 24),
            
            loginMetamaskRigthLogoImageView.centerYAnchor.constraint(equalTo: loginMetamaskBackgroundView.centerYAnchor),
            loginMetamaskRigthLogoImageView.trailingAnchor.constraint(equalTo: loginMetamaskBackgroundView.trailingAnchor, constant: -50),
            loginMetamaskRigthLogoImageView.widthAnchor.constraint(equalTo: loginMetamaskLeftLogoImageView.widthAnchor),
            loginMetamaskRigthLogoImageView.heightAnchor.constraint(equalTo: loginMetamaskLeftLogoImageView.heightAnchor),
            
            loginMetamaskButton.topAnchor.constraint(equalTo: loginMetamaskBackgroundView.topAnchor),
            loginMetamaskButton.leadingAnchor.constraint(equalTo: loginMetamaskBackgroundView.leadingAnchor),
            loginMetamaskButton.trailingAnchor.constraint(equalTo: loginMetamaskBackgroundView.trailingAnchor),
            loginMetamaskButton.bottomAnchor.constraint(equalTo: loginMetamaskBackgroundView.bottomAnchor)
        ])
    }
    
    func configTextFieldDelegate(delegate: UITextFieldDelegate) {
        emailTextField.delegate = delegate
        passwordTextField.delegate = delegate
    }
    
    func isEnableLoginButton(isEnable: Bool) {
        loginButton.setTitleColor(isEnable ? .white : .lightGray, for: .normal)
        loginButton.isEnabled = isEnable
        backgroundButtonImageView.alpha = isEnable ? 1 : 0.4
    }
}
