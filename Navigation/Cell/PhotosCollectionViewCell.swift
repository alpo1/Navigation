//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Саша on 23.05.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    private var photosImageView: UIImageView = {
           $0.translatesAutoresizingMaskIntoConstraints = false
           $0.backgroundColor = .black
           $0.contentMode = .scaleAspectFill
           $0.layer.cornerRadius = 0
           $0.clipsToBounds = true
           return $0
       }(UIImageView())
       
       override init(frame: CGRect) {
           super.init(frame: frame)
           setupLayout()
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
       func setupCell(_ photo: PhotosModel) {
           photosImageView.image = UIImage(named: photo.image)
           
       }
       
       private func setupLayout() {
           contentView.addSubview(photosImageView)
           
           NSLayoutConstraint.activate([
               photosImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
               photosImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
               photosImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
               photosImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor)
           ])
       }
}
