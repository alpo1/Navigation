//
//  InfoViewController.swift
//  Navigation
//
//  Created by Саша on 16.05.2022.
//

import UIKit

class InfoViewController: UIViewController {
    override func viewDidLoad() {
           super.viewDidLoad()
           view.backgroundColor = .gray
           setupButton()
       }
       
       private lazy var button: UIButton = {
           let button = UIButton()
           button.backgroundColor = .blue
           button.setTitle("Доступные действия", for: .normal)
           button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
           button.translatesAutoresizingMaskIntoConstraints = false
           return button
       }()
       
       private func setupButton() {
           self.view.addSubview(self.button)
           self.button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100).isActive = true
           self.button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
           self.button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
           self.button.heightAnchor.constraint(equalToConstant: 50).isActive = true
       }
       
       @objc private func buttonAction() {
           setAlert()
       }
       
       private func setAlert() {
           let alert = UIAlertController(title: "Действия", message: "Выберите действие", preferredStyle: .alert)
           let actionPrint = UIAlertAction(title: "Вывести текст в консоль", style: .default) { (_) -> Void in
               print("Вывести текст")
           }
           let actionDismiss = UIAlertAction(title: "Закрыть окно", style: .default) { (_) -> Void in
               self.dismiss(animated: true, completion: nil)
           }
           
           alert.addAction(actionPrint)
           alert.addAction(actionDismiss)
           
           self.present(alert, animated: true, completion: nil)
       }
   }

//    override func viewDidLoad() {
//          super.viewDidLoad()
//          view.backgroundColor = .white
//          self.navigationItem.title = "Информация"
//          makeButton()
//      }
//
//      private func makeButton() {
//          let alertButton = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
//          alertButton.center = view.center
//          alertButton.setTitle("Изменить", for: .normal)
//          alertButton.backgroundColor = .darkGray
//          alertButton.layer.cornerRadius = 4
//          alertButton.addTarget(self, action: #selector(tapAlertAction), for: .touchUpInside)
//          view.addSubview(alertButton)
//      }
//
//      @objc private func tapAlertAction () {
//          let alert = UIAlertController(title: "Информация изменена", message: "Сохранить?", preferredStyle: .alert)
//          let okAction = UIAlertAction(title: "Да", style: .default) {_ in
//              print("Запись изменена")
//              // self.dismiss(animated: true)
//              self.navigationController?.popViewController(animated: true)
//          }
//          let cancelAction = UIAlertAction(title: "Отмена", style: .destructive) { _ in
//              print("Отмена действия")
//          }
//          alert.addAction(cancelAction)
//          alert.addAction(okAction)
//          present(alert, animated: false)
//
//      }
//
//  }
