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
           $0.translatesAutoresizingMaskIntoConstraints = false
           return $0
       }(UIScrollView())
       
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
       // Сдвигаем scrollView.bottom вверх на высоту клавиатуры
       @objc private func keyboardShow(notification: NSNotification) {
           if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
               scrollView.contentInset.bottom = keyboardSize.height + 32
               scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height + 32, right: 0)
           }
       }
       @objc private func keyboardHide() {
           scrollView.contentInset = .zero
           scrollView.verticalScrollIndicatorInsets = .zero
       }
       
       private let logoImage: UIImageView = {
           $0.translatesAutoresizingMaskIntoConstraints = false
           $0.image = UIImage(named: "logo.jpg")
           $0.contentMode = .scaleAspectFill
           return $0
       }(UIImageView())
       
       private let stackView: UIStackView = {
           $0.translatesAutoresizingMaskIntoConstraints = false
           $0.alignment = .fill
           $0.distribution = .fillEqually
           $0.axis = .vertical
           $0.spacing = 0.5
           $0.layer.borderWidth = 0.5
           $0.layer.cornerRadius = 10
           $0.backgroundColor = .lightGray
           $0.clipsToBounds = true
           $0.layer.borderColor = UIColor.lightGray.cgColor
           return $0
       }(UIStackView())
       
       private lazy var userLoginTextField: UITextField = {
           $0.translatesAutoresizingMaskIntoConstraints = false
           $0.indent(size: 10)
           $0.placeholder = "Email or phone"
           $0.textColor = .black
           $0.font = UIFont.systemFont(ofSize: 16, weight: .regular)
           $0.autocapitalizationType = .none
           $0.backgroundColor = .systemGray6
           $0.delegate = self
           $0.addTarget(self, action: #selector(userLogin), for: .editingChanged)
           return $0
       }(UITextField())
       
       @objc private func userLogin() {
           
       }
       
       private lazy var userPasswordTextField: UITextField = {
           $0.translatesAutoresizingMaskIntoConstraints = false
           $0.indent(size: 10)
           $0.placeholder = "Password"
           $0.isSecureTextEntry = true
           $0.textColor = .black
           $0.font = UIFont.systemFont(ofSize: 16, weight: .regular)
           $0.backgroundColor = .systemGray6
           $0.delegate = self
           $0.addTarget(self, action: #selector(userPassword), for: .editingChanged)
           return $0
       }(UITextField())
       
       @objc private func userPassword() {
       }
       
       private lazy var logInButton: UIButton = {
           let colorButton = UIColor(patternImage: UIImage(named: "blue_pixel.png")!)
           $0.translatesAutoresizingMaskIntoConstraints = false
           $0.setTitle("Log In", for: .normal)
           $0.backgroundColor = colorButton
           $0.layer.cornerRadius = 10
           $0.setTitleColor(UIColor.white, for: .normal)
           $0.backgroundColor?.withAlphaComponent(1)
           if $0.isSelected || $0.isHighlighted || $0.isEnabled == false {
               $0.backgroundColor?.withAlphaComponent(0.8)
           }
           $0.addTarget(self, action: #selector(logInButtonAction), for: .touchUpInside)
           return $0
       }(UIButton())
       
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
               // !!! Обязательно закрепить нижний элемент к низу contentView !!!
               logInButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
           ])
       }
       
   }
// UITextFieldDelegate
   extension LogInViewController: UITextFieldDelegate {
       func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           view.endEditing(true)
           return true
       }
   }
