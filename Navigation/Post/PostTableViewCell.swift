//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Саша on 22.05.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    private let postView: UIView = {
          $0.translatesAutoresizingMaskIntoConstraints = false
          $0.backgroundColor = .white
          return $0
      }(UIView())
      
      private let authorLabel: UILabel = {
          $0.translatesAutoresizingMaskIntoConstraints = false
          $0.textColor = .black
          $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
          $0.numberOfLines = 2
          return $0
      }(UILabel())
      
      private let descriptionLabel: UILabel = {
          $0.translatesAutoresizingMaskIntoConstraints = false
          $0.textColor = .systemGray
          $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
          $0.numberOfLines = 0
          $0.textAlignment = .justified
          return $0
      }(UILabel())
      
      private lazy var postImageView: UIImageView = {
          $0.translatesAutoresizingMaskIntoConstraints = false
          $0.backgroundColor = .black
          $0.contentMode = .scaleAspectFit
          $0.isUserInteractionEnabled = true
          $0.addGestureRecognizer(tapOnImage)
//          $0.clipsToBounds = true
          return $0
      }(UIImageView())
      
      private lazy var likesLabel: UILabel = {
          $0.translatesAutoresizingMaskIntoConstraints = false
          $0.numberOfLines = 1
          $0.textColor = .black
          $0.font = UIFont.systemFont(ofSize: 16, weight: .regular)
          $0.text = "Likes: "
          $0.isUserInteractionEnabled = true
          $0.addGestureRecognizer(tapOnLabel)
          return $0
      }(UILabel())
    
    private lazy var numberOfLikes: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .systemFont(ofSize: 16, weight: .regular)
        $0.textColor = .black
        $0.text = "0"
        return $0
    }(UILabel())
      
      private let viewsLabel: UILabel = {
          $0.translatesAutoresizingMaskIntoConstraints = false
          $0.textColor = .black
          $0.font = UIFont.systemFont(ofSize: 16, weight: .regular)
          $0.backgroundColor = .white
          $0.text = "Views: "
          return $0
      }(UILabel())
    
    private lazy var numberOfViews: UILabel = {
             $0.translatesAutoresizingMaskIntoConstraints = false
             $0.font = .systemFont(ofSize: 16, weight: .regular)
             $0.textColor = .black
             $0.text = "0"
             return $0
         }(UILabel())
      
      override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
          super.init(style: style, reuseIdentifier: reuseIdentifier)
          setupLayout()
          customizeCell()
      }
      
      required init?(coder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }
    
    //  MARK: - Обработка нажатий
         
         //    Обработка нажатия на лебл с лайками
         
         lazy var tapOnLabel = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))

         @objc func tapLabel() {
             numberOfLikes.text = reciverOfDataFromeCell?.addLikes(likesInLabel: numberOfLikes.text ?? "0")
         }

         //    Обработка нажатия на картинку
         
         lazy var tapOnImage = UITapGestureRecognizer(target: self, action: #selector(tapImage))

         @objc func tapImage() {
             numberOfViews.text = reciverOfDataFromeCell?.showPhoto(viewsInLabel: numberOfViews.text ?? "0", postPhoto: postImageView.image!)
         }
      
      func setupCell(model: PostModel) {
          authorLabel.text = model.author
          descriptionLabel.text = model.description
          postImageView.image = model.image
          numberOfLikes.text = "\(model.likes)"
          numberOfViews.text = "\(model.views)"
      }
      
      private func customizeCell() {
          postView.layer.cornerRadius = 0
          postView.layer.borderWidth = 0
          postView.layer.borderColor = UIColor.black.cgColor
      }
      
      private func setupLayout() {
          [postView, authorLabel, descriptionLabel, postImageView, likesLabel, viewsLabel, numberOfViews, numberOfLikes].forEach { contentView.addSubview($0) }
          
          let inset: CGFloat = 16
          
          NSLayoutConstraint.activate([
            // postView
              postView.topAnchor.constraint(equalTo: contentView.topAnchor),
              postView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
              postView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
              postView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
       
              // authorLabel
              authorLabel.topAnchor.constraint(equalTo: postView.topAnchor, constant: inset),
              authorLabel.leadingAnchor.constraint(equalTo: postView.leadingAnchor, constant: inset),
              authorLabel.trailingAnchor.constraint(equalTo: postView.trailingAnchor, constant: -inset),
             
              // postImageView
              postImageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 12),
              postImageView.leadingAnchor.constraint(equalTo: postView.leadingAnchor),
              postImageView.heightAnchor.constraint(equalTo: postImageView.widthAnchor),
              postImageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
             
              // descriptionLabel
              descriptionLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: inset),
              descriptionLabel.leadingAnchor.constraint(equalTo: postView.leadingAnchor, constant: inset),
              descriptionLabel.trailingAnchor.constraint(equalTo: postView.trailingAnchor, constant: -inset),
              
              // likesLabel
              likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: inset),
              likesLabel.leadingAnchor.constraint(equalTo: postView.leadingAnchor, constant: inset),
              likesLabel.bottomAnchor.constraint(equalTo: postView.bottomAnchor, constant: -inset),
              
              //numberOfLikes
              numberOfLikes.topAnchor.constraint(equalTo: likesLabel.topAnchor),
              numberOfLikes.leadingAnchor.constraint(equalTo: likesLabel.trailingAnchor),
              numberOfLikes.bottomAnchor.constraint(equalTo: postView.bottomAnchor, constant: -inset),
              
              // viewsLabel
              viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: inset),
              viewsLabel.trailingAnchor.constraint(equalTo: numberOfViews.leadingAnchor),
              viewsLabel.bottomAnchor.constraint(equalTo: postView.bottomAnchor, constant: -inset),
              
              //numberOfViews
              numberOfViews.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: inset),
              numberOfViews.trailingAnchor.constraint(equalTo: postView.trailingAnchor, constant: -inset),
              numberOfViews.bottomAnchor.constraint(equalTo: postView.bottomAnchor, constant: -inset),
          ])
      }
 

//  MARK: - Делегат
    
    var reciverOfDataFromeCell: DelegateOfReciverOfDataFromeCell?
}
