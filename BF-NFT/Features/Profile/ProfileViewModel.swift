//
//  ProfileViewModel.swift
//  BF-NFT
//
//  Created by Juliano Sgarbossa on 14/09/26.
//

import Foundation
import FirebaseAuth

protocol ProfileViewModelDelegate: AnyObject {
    func logoutSucceeded()
    func logoutFailed(with error: Error)
}

final class ProfileViewModel {
    private weak var delegate: ProfileViewModelDelegate?

    func delegate(delegate: ProfileViewModelDelegate) {
        self.delegate = delegate
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
            delegate?.logoutSucceeded()
        } catch {
            delegate?.logoutFailed(with: error)
        }
    }
    
    var numberOfRowsInSection: Int {
        return 2
    }
    
    var heightForRowAt: CGFloat {
        return 280
    }
}
