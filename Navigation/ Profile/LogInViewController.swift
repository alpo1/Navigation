//
//  LogInViewController.swift
//  Navigation
//
//  Created by Саша on 22.05.2022.
//

import UIKit

class LogInViewController: UIViewController {

    private let notify = NotificationCenter.default
       
       private let scrollView: UIScrollView = {
           let scrollView =  UIScrollView()
           scrollView.translatesAutoresizingMaskIntoConstraints = false
           return scrollView
       }()
       // contentView
       private let contentView: UIView = {
           $0.translatesAutoresizingMaskIntoConstraints = false
           $0.backgroundColor = .white
           return $0
       }(UIView())
       
       override func viewDidLoad() {
           super.viewDidLoad()
           self.navigationController?.isNavigationBarHidden = true
           view.backgroundColor = .white
           setupLayout()
       }
       
       override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           notify.addObserver(self, selector: #selector(keyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
           notify.addObserver(self, selector: #selector(keyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
       }
       // Сдвигаем scrollView.bottom верх на высоту клавиатуры
       @objc private func keyboardShow(notification: NSNotification) {
           if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
               scrollView.contentInset.bottom = keyboardSize.height + 32
               scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height + 32, right: 0)
           }
       }
       // Восстанавливаем исходное значение scrollView.bottom
       @objc private func keyboardHide() {
           scrollView.contentInset = .zero
           scrollView.verticalScrollIndicatorInsets = .zero
       }
       
       private let logoImage: UIImageView = {
           let logoImage = UIImageView()
           logoImage.translatesAutoresizingMaskIntoConstraints = false
           logoImage.image = UIImage(named: "logo.jpg")
           logoImage.contentMode = .scaleAspectFill
           return logoImage
       }()
       
       private let stackView: UIStackView = {
           let stackView = UIStackView()
           stackView.translatesAutoresizingMaskIntoConstraints = false
           stackView.alignment = .fill
           stackView.distribution = .fillEqually
           stackView.axis = .vertical
           stackView.spacing = 0.5
           stackView.layer.borderWidth = 0.5
           stackView.layer.cornerRadius = 10
           stackView.backgroundColor = .lightGray
           stackView.clipsToBounds = true
           stackView.layer.borderColor = UIColor.lightGray.cgColor
           return stackView
       }()
       
       private lazy var userLoginTextField: UITextField = {
           let userLoginTextField = UITextField()
           userLoginTextField.translatesAutoresizingMaskIntoConstraints = false
           userLoginTextField.indent(size: 10)
           userLoginTextField.placeholder = "Email or phone"
           userLoginTextField.textColor = .black
           userLoginTextField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
           userLoginTextField.autocapitalizationType = .none
           userLoginTextField.backgroundColor = .systemGray6
           userLoginTextField.delegate = self
           userLoginTextField.addTarget(self, action: #selector(userLogin), for: .editingChanged)
           return userLoginTextField
       }()
       
       @objc private func userLogin() {
           
       }
       
       private lazy var userPasswordTextField: UITextField = {
           let userPasswordTextField = UITextField()
           userPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
           userPasswordTextField.indent(size: 10)
           userPasswordTextField.placeholder = "Password"
           userPasswordTextField.isSecureTextEntry = true
           userPasswordTextField.textColor = .black
           userPasswordTextField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
           userPasswordTextField.backgroundColor = .systemGray6
           userPasswordTextField.delegate = self
           userPasswordTextField.addTarget(self, action: #selector(userPassword), for: .editingChanged)
           return userPasswordTextField
       }()
       @objc private func userPassword() {

       }
       
       private lazy var logInButton: UIButton = {
           let logInButton = UIButton()
           let colorButton = UIColor(patternImage: UIImage(named: "blue_pixel.png")!)
           logInButton.translatesAutoresizingMaskIntoConstraints = false
           logInButton.setTitle("Log In", for: .normal)
           logInButton.backgroundColor = colorButton
           logInButton.layer.cornerRadius = 10
           logInButton.setTitleColor(UIColor.white, for: .normal)
           logInButton.backgroundColor?.withAlphaComponent(1)
           if logInButton.isSelected || logInButton.isHighlighted || logInButton.isEnabled == false {
               logInButton.backgroundColor?.withAlphaComponent(0.8)
           }
           logInButton.addTarget(self, action: #selector(logInButtonAction), for: .touchUpInside)
           return logInButton
       }()
       
       @objc private func logInButtonAction() {
           let profileView = ProfileViewController()
           self.navigationController?.pushViewController(profileView, animated: false)
       }
       
       private func setupLayout() {
           view.addSubview(scrollView)
           
           NSLayoutConstraint.activate([
               scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
               scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
               scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
               scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
           ])
           
           scrollView.addSubview(contentView)
           
           NSLayoutConstraint.activate([
               contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
               contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
               contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
               contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
               contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
           ])
           
           [logoImage, stackView, logInButton].forEach { contentView.addSubview($0) }
           [userLoginTextField, userPasswordTextField].forEach { stackView.addArrangedSubview($0) }
           
           NSLayoutConstraint.activate([
               // logoImage
               logoImage.centerXAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerXAnchor),
               logoImage.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 120),
               logoImage.heightAnchor.constraint(equalToConstant: 100),
               logoImage.widthAnchor.constraint(equalToConstant: 100),
               // stackView
               stackView.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 120),
               stackView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
               stackView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
               stackView.heightAnchor.constraint(equalToConstant: 100),
               // firstButton
               userLoginTextField.heightAnchor.constraint(equalToConstant: 50),
               // secondButton
               userPasswordTextField.heightAnchor.constraint(equalToConstant: 50),
               // logInButton
               logInButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
               logInButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
               logInButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16),
               logInButton.heightAnchor.constraint(equalToConstant: 50),
               logInButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
           ])
       }
       
   }
   extension LogInViewController: UITextFieldDelegate {
       func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           view.endEditing(true)
           return true
       }
   }

   
