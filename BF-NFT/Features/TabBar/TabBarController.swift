//
//  TabBarController.swift
//  BF-NFT
//
//  Created by Juliano Sgarbossa on 11/09/26.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    private func setupTabBar() {
        let homeViewController = HomeViewController()
        let homeNavigationController = UINavigationController(rootViewController: homeViewController)
        
        viewControllers = [homeNavigationController]
        tabBar.tintColor = UIColor(red: 130/255, green: 26/255, blue: 201/255, alpha: 1.0)
        
        guard let items = tabBar.items else { return }
        items[0].image = UIImage(systemName: "house.fill")
    }
}
