//
//  FeedViewController.swift
//  Navigation
//
//  Created by Саша on 16.05.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
override func viewDidLoad() {
       super.viewDidLoad()
       view.backgroundColor = .white
       setupLayout()
   }
   
   private let stackView: UIStackView = {
       $0.translatesAutoresizingMaskIntoConstraints = false
       $0.axis = .vertical
       $0.spacing = 10
       return $0
   }(UIStackView())
   
   private lazy var firstButton: UIButton = {
       $0.translatesAutoresizingMaskIntoConstraints = false
       $0.setTitle("First button", for: .normal)
       $0.backgroundColor = UIColor(hex: 0x4885CC)
       $0.layer.cornerRadius = 10
       $0.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
       return $0
   }(UIButton())
   
   @objc func buttonAction(sender: UIButton!) {
       self.navigationController?.pushViewController(PostViewController(), animated: true)
   }
   
   private lazy var secondButton: UIButton = {
       $0.translatesAutoresizingMaskIntoConstraints = false
       $0.setTitle("Second button", for: .normal)
       $0.backgroundColor = UIColor(hex: 0x4885CC)
       $0.layer.cornerRadius = 10
       $0.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
       return $0
   }(UIButton())
   
   private func setupLayout() {
       view.addSubview(stackView)
       [firstButton, secondButton].forEach { stackView.addArrangedSubview($0) }
       
       NSLayoutConstraint.activate([
           // stackView
           stackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
           stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
           stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
           stackView.heightAnchor.constraint(equalToConstant: 110),
           // firstButton
           firstButton.heightAnchor.constraint(equalToConstant: 50),
           // secondButton
           secondButton.heightAnchor.constraint(equalToConstant: 50)
       ])
   }
}
