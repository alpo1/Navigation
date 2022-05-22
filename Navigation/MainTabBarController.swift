//
//  MainTabBarController.swift
//  Navigation
//
//  Created by Саша on 16.05.2022.
//

import UIKit

class MainTabBarController: UITabBarController {
    let colorSet = UIColor(hex: 0x4885CC)
    let feedView = FeedViewController()
    let logInView = LogInViewController()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .white
            self.view.tintColor = UIColor(ciColor: .init(color: colorSet))
            setupControllers()
        }

        private func setupControllers() {
            
            let feedNavigationController = UINavigationController(rootViewController: feedView)
            let LogInViewController = UINavigationController(rootViewController: logInView)
            
            feedView.tabBarItem.title = "Feed"
            feedView.tabBarItem.image = UIImage(systemName: "house.fill")
            feedView.navigationItem.title = "Feed"
            
            logInView.tabBarItem.title = "Profile"
            logInView.tabBarItem.image = UIImage(systemName: "person.fill")
            logInView.navigationItem.title = "Profile"
            
            viewControllers = [feedNavigationController, LogInViewController]
            
        }
    }
// перевод цвета из HEX в RGB

extension UIColor {
    convenience init(hex: Int) {
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )
        self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
    }
}
