//
//  FeedViewController.swift
//  Navigation
//
//  Created by Саша on 16.05.2022.
//

import UIKit

struct Post {
    var title : String
}

class FeedViewController: UIViewController {

    var post = Post(title: "Новая публикация")
    override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .systemBackground
            makeButton()
        }
        
        private func makeButton() {
            let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
            button.center = view.center
            button.setTitle("К публикации", for: .normal)
            button.backgroundColor = .systemGray
            button.layer.cornerRadius = 4
            button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
            view.addSubview(button)
        }

        @objc private func buttonAction() {
            let postView = PostViewController()
            postView.postTitle = post.title
            navigationController?.pushViewController(postView, animated: true)
        }
    }
