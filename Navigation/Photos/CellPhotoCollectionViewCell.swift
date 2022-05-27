//
//  CellPhotoCollectionViewCell.swift
//  Navigation
//
//  Created by Саша on 27.05.2022.
//

import UIKit

// Конфигурирем наш collectionView (ячейка с 4мя фотками, со скролом по горизонтали в 1 секции нашей общей TableView страницы)
class CellPhotoCollectionViewCell: UICollectionViewCell {
    
    private let photoImages: UIImageView = {
        let photoImages = UIImageView()
        photoImages.translatesAutoresizingMaskIntoConstraints = false
        photoImages.contentMode = .scaleAspectFill
        photoImages.clipsToBounds = true
        photoImages.layer.cornerRadius = 6
        return photoImages
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Метод показа фото
    func setupImageModel(image: UIImage) {
        photoImages.image = image
    }
    
    private func imageLayout() {
        contentView.addSubview(photoImages)
        
        // констрейны photoImages на CollectionView для TableView
        NSLayoutConstraint.activate([
            photoImages.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoImages.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoImages.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            photoImages.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}
