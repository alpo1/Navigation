//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Саша on 23.05.2022.
//

import UIKit

class PhotosViewController: UIViewController {

    //  MARK: - Создание, настройка и размещение коллекции
    
    private lazy var photoCollection: UICollectionView = {
        let layoutForCollection = UICollectionViewFlowLayout()
        let collectionGallery = UICollectionView(frame: .zero, collectionViewLayout: layoutForCollection )
        
        collectionGallery.translatesAutoresizingMaskIntoConstraints = false
        collectionGallery.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)
        collectionGallery.dataSource = self
        collectionGallery.delegate = self
        return collectionGallery
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        
        //  title в Галерею
        self.navigationItem.title = "Фото Галерея"
        navigationController?.navigationBar.isHidden = true
        
        setup()
    }
    override func viewWillAppear(_ animated: Bool) {
                super.viewWillAppear(animated)
                navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func setup() {
        view.addSubview(photoCollection)
        
        NSLayoutConstraint.activate([
            photoCollection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            photoCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            photoCollection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            photoCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}


// MARK: - UICollectionViewDataSource
extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoGalery.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier, for: indexPath) as! PhotosCollectionViewCell
        cell.setupCell(image: photoGalery[indexPath.item])
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    var sideInset: CGFloat { return 8 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - sideInset * 4) / 3
        return CGSize(width: width, height: width)
    }
    
    // Метод для установки высоты меджу фотографиями
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sideInset
    }
    
    // Метод для устновки расстояний со всех сторон
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: sideInset, left: sideInset, bottom: sideInset, right: sideInset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sideInset
    }
    
    // Метод отвечающий за выбор ячейки в галерее с фото
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presentPhoto(indexOfPhoto: indexPath.item)
    }
}

//  MARK: - Настройка расширения для увеличения фото, при нажатии на нее, на весь экран
extension PhotosViewController {
    
    func presentPhoto(indexOfPhoto: Int) {
        lazy var photoImageView: UIImageView = {
            lazy var imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.image = photoGalery[indexOfPhoto]
            imageView.contentMode = .scaleAspectFit
            imageView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)
            imageView.isUserInteractionEnabled = true
            return imageView
        }()
        
        view.addSubview(photoImageView)
        
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        lazy var tapToImage = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
        photoImageView.addGestureRecognizer(tapToImage)
        
    }
    
    @objc func dismissFullscreenImage(_ sender: UITapGestureRecognizer) {
        sender.view?.removeFromSuperview()
    }
}
