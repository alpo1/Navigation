//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Саша on 23.05.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {

    private let photosView: UIView = {
           $0.translatesAutoresizingMaskIntoConstraints = false
           $0.backgroundColor = .white
           return $0
       }(UIView())
       
       private let photosLabel: UILabel = {
           $0.translatesAutoresizingMaskIntoConstraints = false
           $0.text = "Photos"
           $0.textColor = .black
           $0.font = UIFont.systemFont(ofSize: 24, weight: .bold)
           $0.numberOfLines = 1
           return $0
       }(UILabel())
       
       private var rightArrowImageView: UIImageView = {
           $0.translatesAutoresizingMaskIntoConstraints = false
           $0.image = UIImage(systemName: "arrow.right")?.withTintColor(.black, renderingMode: .alwaysOriginal)
           $0.sizeToFit()
           $0.clipsToBounds = false
           return $0
       }(UIImageView())
       
       private var stackView: UIStackView = {
           $0.translatesAutoresizingMaskIntoConstraints = false
           $0.alignment = .fill
           $0.distribution = .fillEqually
           $0.axis = .horizontal
           $0.spacing = 8
           $0.layer.cornerRadius = 6
           $0.backgroundColor = .white
           $0.clipsToBounds = true
           $0.layer.borderColor = UIColor.lightGray.cgColor
           return $0
       }(UIStackView())
       
       private var firstImageView: UIImageView = {
           $0.translatesAutoresizingMaskIntoConstraints = false
           $0.image = UIImage(named: "01")
           $0.backgroundColor = .black
           $0.contentMode = .scaleAspectFill
           $0.layer.cornerRadius = 6
           $0.clipsToBounds = true
           return $0
       }(UIImageView())
       
       private var secondImageView: UIImageView = {
           $0.translatesAutoresizingMaskIntoConstraints = false
           $0.image = UIImage(named: "02")
           $0.backgroundColor = .black
           $0.contentMode = .scaleAspectFill
           $0.layer.cornerRadius = 6
           $0.clipsToBounds = true
           return $0
       }(UIImageView())
       
       private var thirdImageView: UIImageView = {
           $0.translatesAutoresizingMaskIntoConstraints = false
           $0.image = UIImage(named: "03")
           $0.backgroundColor = .black
           $0.contentMode = .scaleAspectFill
           $0.layer.cornerRadius = 6
           $0.clipsToBounds = true
           return $0
       }(UIImageView())
       
       private var fourthImageView: UIImageView = {
           $0.translatesAutoresizingMaskIntoConstraints = false
           $0.image = UIImage(named: "04")
           $0.backgroundColor = .black
           $0.contentMode = .scaleAspectFill
           $0.layer.cornerRadius = 6
           $0.clipsToBounds = true
           return $0
       }(UIImageView())
       
       override func setSelected(_ selected: Bool, animated: Bool) {
           super.setSelected(selected, animated: animated)
       }
       override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
           setupLayout()
           customizeCell()
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
       private func customizeCell() {
           photosView.layer.cornerRadius = 0
           photosView.layer.borderWidth = 0
           photosView.layer.borderColor = UIColor.black.cgColor
       }
       
       private func setupLayout() {
           let firstInset: CGFloat = 12
           let secondInset: CGFloat = 12
           
           [firstImageView, secondImageView, thirdImageView, fourthImageView].forEach { stackView.addArrangedSubview($0) }
           
           [photosView, photosLabel, rightArrowImageView, stackView].forEach { contentView.addSubview($0) }
           
           NSLayoutConstraint.activate([
               // photosView
               photosView.topAnchor.constraint(equalTo: contentView.topAnchor),
               photosView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
               photosView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
               photosView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
               // photosLabel
               photosLabel.topAnchor.constraint(equalTo: photosView.topAnchor, constant: firstInset),
               photosLabel.leadingAnchor.constraint(equalTo: photosView.leadingAnchor, constant: firstInset),
               photosLabel.trailingAnchor.constraint(equalTo: photosView.trailingAnchor, constant: -firstInset),
               // rightArrowImageView
               rightArrowImageView.topAnchor.constraint(equalTo: photosView.topAnchor, constant: firstInset),
               rightArrowImageView.centerYAnchor.constraint(equalTo: photosLabel.centerYAnchor),
               rightArrowImageView.trailingAnchor.constraint(equalTo: photosView.trailingAnchor, constant: -firstInset),
               rightArrowImageView.widthAnchor.constraint(equalToConstant: 24),
               rightArrowImageView.heightAnchor.constraint(equalToConstant: 28),
               // stackView
               stackView.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: firstInset),
               stackView.leadingAnchor.constraint(equalTo: photosView.leadingAnchor, constant: firstInset),
               stackView.trailingAnchor.constraint(equalTo: photosView.trailingAnchor, constant: -firstInset),
               stackView.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - (firstInset * 2 + secondInset * 3)) / 4),
               stackView.bottomAnchor.constraint(equalTo: photosView.bottomAnchor, constant: -firstInset)
           ])
           
       }
}
