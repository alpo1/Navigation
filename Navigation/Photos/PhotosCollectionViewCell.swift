//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Саша on 23.05.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    private var galleryImages: UIImageView = {
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
       
    func setupCell(image: UIImage) {
           galleryImages.image = image
           
       }
       
       private func setupLayout() {
           contentView.addSubview(galleryImages)
           
           NSLayoutConstraint.activate([
               galleryImages.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
               galleryImages.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
               galleryImages.widthAnchor.constraint(equalTo: contentView.widthAnchor),
               galleryImages.heightAnchor.constraint(equalTo: contentView.heightAnchor)
           ])
       }
}
