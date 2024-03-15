//
//  MainTabBarController.swift
//  testnsk
//
//  Created by Владислав Береснев on 14.03.2024.
//

import UIKit

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let characterListVC = CharacterListViewController()
        characterListVC.tabBarItem = UITabBarItem(title: "Список персонажей", image: UIImage(systemName: "list.bullet"), selectedImage: nil)

        let favoritesVC = FavoritesViewController()
        favoritesVC.tabBarItem = UITabBarItem(title: "Избранное", image: UIImage(systemName: "star"), selectedImage: nil)

        viewControllers = [characterListVC, favoritesVC]
    }
}

