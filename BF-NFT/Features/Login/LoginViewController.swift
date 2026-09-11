//
//  LoginViewController.swift
//  BF-NFT
//
//  Created by Juliano Sgarbossa on 10/09/26.
//

import UIKit

class LoginViewController: UIViewController {
    
    private var screen: LoginScreen?
    private let viewModel: LoginViewModel = LoginViewModel()
    
    override func loadView() {
        screen = LoginScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigation()
        configProtocols()
        dismissKeyboard()
        validateTextFields()
    }
    
    private func configNavigation() {
        navigationController?.navigationBar.isHidden = true
    }
    
    private func configProtocols() {
        screen?.delegate(delegate: self)
        screen?.configTextFieldDelegate(delegate: self)
        viewModel.delegate(delegate: self)
    }
    
    private func validateTextFields() {
        guard let email = screen?.emailTextField.text,
              let password = screen?.passwordTextField.text else { return }
        let isEnableLoginButton = viewModel.validateEmailAndPassword(email: email, password: password)
        screen?.isEnableLoginButton(isEnable: isEnableLoginButton)
    }
}

extension LoginViewController: LoginScreenDelegate {
    func tappedRecoveryPasswordButton() {
        showAlert(title: "Atenção", message: "A funcionalidade de recuperar senha será implementada em breve.")
    }
    
    func tappedLoginButton() {
        guard let email = screen?.emailTextField.text,
              let password = screen?.passwordTextField.text else { return }
        viewModel.signInWithEmailAndPassword(email: email, password: password)
    }
    
    func tappedLoginMetamaskButton() {
        showAlert(title: "Atenção", message: "A funcionalidade de fazer o login com metamask será implementada em breve.")
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text?.isEmpty ?? false {
            textField.layer.borderWidth = 1.5
            textField.layer.borderColor = UIColor.red.cgColor
        } else {
            switch textField {
            case screen?.emailTextField:
                guard let email = screen?.emailTextField.text else { return }
                let isValid = viewModel.validateEmail(email: email)
                screen?.emailTextField.layer.borderWidth = isValid ? 1 : 1.5
                screen?.emailTextField.layer.borderColor = isValid ? UIColor.white.withAlphaComponent(0.4).cgColor : UIColor.red.cgColor
            case screen?.passwordTextField:
                guard let password = screen?.passwordTextField.text else { return }
                let isValid = viewModel.validatePassword(password: password)
                screen?.passwordTextField.layer.borderWidth = isValid ? 1 : 1.5
                screen?.passwordTextField.layer.borderColor = isValid ? UIColor.white.withAlphaComponent(0.4).cgColor : UIColor.red.cgColor
            default:
                break
            }
        }
        validateTextFields()
    }
}

extension LoginViewController: LoginViewModelDelegate {
    func loginSuccess() {
        let tabBarController = TabBarController()
        tabBarController.modalPresentationStyle = .fullScreen
        present(tabBarController, animated: true)
    }
    
    func loginFailure(error: String) {
        showAlert(title: "Falha no login", message: error)
    }
}
