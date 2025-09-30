//
//  LoginViewController.swift
//  BFNFT
//
//  Created by Juliano Sgarbossa on 29/09/25.
//

import UIKit

class LoginViewController: UIViewController {

    private var loginScreen: LoginScreen?
    
    override func loadView() {
        loginScreen = LoginScreen()
        self.view = loginScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }
}

