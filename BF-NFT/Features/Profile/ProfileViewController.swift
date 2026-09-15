//
//  ProfileViewController.swift
//  BF-NFT
//
//  Created by Juliano Sgarbossa on 14/09/26.
//

import UIKit

enum ProfileNameCell: Int {
    case profileImage = 0
    case profile = 1
}

class ProfileViewController: UIViewController {
    
    private var screen: ProfileScreen?
    private let viewModel: ProfileViewModel = ProfileViewModel()
    
    override func loadView() {
        screen = ProfileScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigation()
        configProtocols()
    }
    
    private func configNavigation() {
        navigationController?.navigationBar.isHidden = true
    }
    
    func configProtocols() {
        screen?.configTableViewProtocols(delegate: self, dataSource: self)
        viewModel.delegate(delegate: self)
    }
}

extension ProfileViewController: UITableViewDelegate {
    
}

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch ProfileNameCell(rawValue: indexPath.row) {
        case .profileImage:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileImageTableViewCell.identifier, for: indexPath) as? ProfileImageTableViewCell else { return UITableViewCell() }
            return cell
        case .profile:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableViewCell.identifier, for: indexPath) as? ProfileTableViewCell else { return UITableViewCell() }
            cell.setupCell(delegate: self)
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRowAt
    }
}

extension ProfileViewController: ProfileViewModelDelegate {
    func logoutSucceeded() {
        dismiss(animated: true)
    }
    
    func logoutFailed(with error: any Error) {
        showAlert(title: "Falha no logout", message: error.localizedDescription)
    }
}

extension ProfileViewController: ProfileTableViewCellScreenDelegate {
    func tappedLogoutButton() {
        viewModel.logout()
    }
}
