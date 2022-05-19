//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Саша on 17.05.2022.
//

import UIKit

extension UITextField {
    func indent(size:CGFloat) {
        self.leftView = UIView(frame: CGRect(x: self.frame.minX, y: self.frame.minY, width: size, height: self.frame.height))
        self.leftViewMode = .always
    }
}

class ProfileHeaderView: UIView {

    private var statusText = String()
      
      override init(frame: CGRect) {
          super.init(frame: frame)
          setupView()
      }
      
      required init?(coder: NSCoder) {
          super.init(coder: coder)
      }
      
      lazy var userAvatarImage: UIImageView = {
          let userAvatarImage = UIImageView()
          userAvatarImage.translatesAutoresizingMaskIntoConstraints = false
          userAvatarImage.image = UIImage(named: "kotik.jpeg")
          userAvatarImage.contentMode = .scaleAspectFill
          userAvatarImage.clipsToBounds = true
          userAvatarImage.backgroundColor = .systemBackground
          userAvatarImage.layer.cornerRadius = 55.0
          userAvatarImage.layer.borderWidth = 3.0
          userAvatarImage.layer.borderColor = UIColor.white.cgColor
          return userAvatarImage
      }()
      
      lazy var userNameLabel: UILabel = {
          let userNameLabel = UILabel()
          userNameLabel.translatesAutoresizingMaskIntoConstraints = false
          userNameLabel.text = "Party Cat"
          userNameLabel.textColor = .black
          userNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
          return userNameLabel
      }()
      
      lazy var userStatusTextField: UITextField = {
          let userStatusTextField = UITextField()
          userStatusTextField.translatesAutoresizingMaskIntoConstraints = false
          userStatusTextField.text = "Waiting for something..."
          userStatusTextField.textColor = .gray
          userStatusTextField.font = UIFont.systemFont(ofSize: 14, weight: .regular)
          userStatusTextField.isUserInteractionEnabled = false
          return userStatusTextField
      }()
      
      lazy var showStatusButton: UIButton = {
          let showStatusButton = UIButton()
          showStatusButton.translatesAutoresizingMaskIntoConstraints = false
          showStatusButton.backgroundColor = .systemBlue
          showStatusButton.setTitle("Show status", for: .normal)
          showStatusButton.setTitleColor(UIColor.white, for: .normal)
          showStatusButton.layer.cornerRadius = 12.0
          showStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
          showStatusButton.layer.shadowRadius = 4.0
          showStatusButton.layer.shadowColor = UIColor.black.cgColor
          showStatusButton.layer.shadowOpacity = 0.7
          showStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
          return showStatusButton
      }()
      
      @objc private func buttonPressed() {
          userStatusTextField.text = statusText
          newStatusTextField.placeholder = "Enter the new status here..."
          self.endEditing(true)
          print("---------")
          print(statusText)
      }
      
      lazy var newStatusTextField: UITextField = {
          let newStatusTextField = UITextField()
          newStatusTextField.translatesAutoresizingMaskIntoConstraints = false
          newStatusTextField.indent(size: 10)
          newStatusTextField.placeholder = "Enter the new status here..."
          newStatusTextField.textColor = .black
          newStatusTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
          newStatusTextField.backgroundColor = .white
          newStatusTextField.layer.borderWidth = 1.0
          newStatusTextField.layer.borderColor = UIColor.black.cgColor
          newStatusTextField.layer.cornerRadius = 12.0
          newStatusTextField.addTarget(self, action: #selector(statusTextChanges), for: .editingChanged)
          return newStatusTextField
      }()
      
      @objc private func statusTextChanges() {
          statusText = newStatusTextField.text!
          print("---------")
          print("Статус изменен")
      }
      
      private func setupLayout(){
          NSLayoutConstraint.activate([
              userAvatarImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
              userAvatarImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16.0),
              userAvatarImage.heightAnchor.constraint(equalToConstant: 110.0),
              userAvatarImage.widthAnchor.constraint(equalToConstant: 110.0),
              
              userNameLabel.leadingAnchor.constraint(equalTo: userAvatarImage.trailingAnchor, constant: 16.0),
              userNameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
              userNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27.0),
              
              userStatusTextField.leadingAnchor.constraint(equalTo: userAvatarImage.trailingAnchor, constant: 16.0),
              userStatusTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
              userStatusTextField.bottomAnchor.constraint(equalTo: showStatusButton.topAnchor, constant: -64.0),
              
              newStatusTextField.leadingAnchor.constraint(equalTo: userAvatarImage.trailingAnchor, constant: 16.0),
              newStatusTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
              newStatusTextField.topAnchor.constraint(equalTo: userStatusTextField.bottomAnchor, constant: 8.0),
              newStatusTextField.heightAnchor.constraint(equalToConstant: 40),
              
              showStatusButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
              showStatusButton.topAnchor.constraint(equalTo: userAvatarImage.bottomAnchor, constant: 16.0),
              showStatusButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -32.0),
              showStatusButton.heightAnchor.constraint(equalToConstant: 50.0)
          ])
      }
      private func setupView(){
          addSubview(userAvatarImage)
          addSubview(userNameLabel)
          addSubview(userStatusTextField)
          addSubview(showStatusButton)
          addSubview(newStatusTextField)
          setupLayout()
      }
  }
