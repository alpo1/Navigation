//
//  PostViewController.swift
//  Navigation
//
//  Created by Саша on 22.05.2022.
//

import UIKit
struct Post {
    var title: String
}
class PostViewController: UIViewController {
    var titlePost: String = "Заголовок Статьи"
        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .green
            self.navigationItem.title = titlePost
            let barButtonItem = UIBarButtonItem(title: "Инфо", style: .plain, target: self, action: #selector(barButtonTap))
            self.navigationItem.rightBarButtonItem = barButtonItem
        }
        @objc private func barButtonTap(){
            let InfoViewController = InfoViewController()
            InfoViewController.modalPresentationStyle = .automatic
            present(InfoViewController, animated: true, completion: nil)
        }
    }
    
