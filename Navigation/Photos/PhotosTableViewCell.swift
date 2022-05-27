//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Саша on 23.05.2022.
//

import UIKit

protocol PhotosTableViewCellDelegate: AnyObject {
    func buttonPushed()
}

class PhotosTableViewCell: UITableViewCell {
    
    weak var delegate: PhotosTableViewCellDelegate?
    // TableCollection для фото на странице профиля, после окна авторизитации ("лента" профиля)
        private lazy var collectionView: UICollectionView = {
            let layoutCollection = UICollectionViewFlowLayout()
            layoutCollection.scrollDirection = .horizontal
            
            let viewCollection = UICollectionView(frame: .zero ,collectionViewLayout: layoutCollection)
            viewCollection.translatesAutoresizingMaskIntoConstraints = false
            viewCollection.dataSource = self
            viewCollection.delegate = self
            viewCollection.register(CellPhotoCollectionViewCell.self, forCellWithReuseIdentifier: CellPhotoCollectionViewCell.identifier)
            return viewCollection
        }()
        
        // Стрелка для переходя в галерею с фото
        private let button: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.tintColor = .black
            button.setImage(UIImage(systemName: "arrow.right"), for: .normal)
            button.addTarget(self, action: #selector(goingToGallery), for: .touchUpInside)
            return button
        }()
        
        // Лейбл для надписи Photo
        private let labelText: UILabel = {
            let labelText = UILabel()
            labelText.translatesAutoresizingMaskIntoConstraints = false
            labelText.textColor = .black
            labelText.font = UIFont.systemFont(ofSize: 24, weight: .bold)
            return labelText
        }()
        
        @objc private func goingToGallery() {
            delegate?.buttonPushed()
        }
        

        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setupLayout()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        // Функция для оторажения лэйбла в нашей ячейке в profileViewController для функции cellForRowAt!!!
        func setupLabel(_ label: String) {
            labelText.text = "Photo"
        }
        
        private func setupLayout() {
            [collectionView, labelText, button] .forEach { contentView.addSubview($0) }
            
            // Отступ в 12 поинтов
            let indent: CGFloat = 12
            let indentForPhoto: CGFloat = 8
            
            NSLayoutConstraint.activate([
                
                // констрейнт collectionView (с фотками с горизонтальным скролом)
                collectionView.topAnchor.constraint(equalTo: labelText.bottomAnchor, constant: indent),
                collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: indent - indentForPhoto),
                collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -indent + indentForPhoto),
                collectionView.heightAnchor.constraint(equalToConstant: 100),
                collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -indent),
                
                // констрейнт labelText (Photo)
                labelText.topAnchor.constraint(equalTo: contentView.topAnchor, constant: indent),
                labelText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: indent),
                
                // констрейнт для button (Стрелка вправо)
                button.centerYAnchor.constraint(equalTo: labelText.centerYAnchor),
                button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -indent)
            ])
        }
    }

    // MARK: - UICollectionViewDataSource
    extension PhotosTableViewCell: UICollectionViewDataSource {
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return photoGalery.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellPhotoCollectionViewCell.identifier, for: indexPath) as!
            CellPhotoCollectionViewCell
            cell.setupImageModel(image: photoGalery[indexPath.item])
            return cell
        }
    }

    // MARK: - UICollectionViewDelegateFlowLayout
    extension PhotosTableViewCell: UICollectionViewDelegateFlowLayout {
        //Настройка отображения 4 фото с отступами 8 поинтов между фото
        var indentForPhoto: CGFloat {return 8}

        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let height = (collectionView.bounds.width - indentForPhoto * 3) / 4
            return CGSize(width: height, height: height)
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return indentForPhoto
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            UIEdgeInsets(top: indentForPhoto, left: indentForPhoto, bottom: indentForPhoto, right: indentForPhoto)
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return indentForPhoto
        }
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            print(indexPath.section, indexPath.item)
        }
    
    }
