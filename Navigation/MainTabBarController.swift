//
//  MainTabBarController.swift
//  Navigation
//
//  Created by Саша on 16.05.2022.
//

import UIKit

class MainTabBarController: UITabBarController {

    let feedView = FeedViewController()
        let profileView = ProfileViewController()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            setupControllers()
        }

        private func setupControllers() {
            
            let feedNavigationController = UINavigationController(rootViewController: feedView)
            let profileNavigationController = UINavigationController(rootViewController: profileView)
            
            feedView.tabBarItem.title = "Лента"
            feedView.tabBarItem.image = UIImage(systemName: "house.fill")
            feedView.navigationItem.title = "Лента"
            
            profileView.tabBarItem.title = "Профиль"
            profileView.tabBarItem.image = UIImage(systemName: "person.fill")
            profileView.navigationItem.title = "Профиль"
            
            viewControllers = [feedNavigationController, profileNavigationController]
            
        }
    }
