//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Саша on 23.05.2022.
//

import UIKit

class PhotosViewController: UIViewController {

    private let photosModel: [PhotosModel] = PhotosModel.makeMockModel()
        
        private lazy var layout: UICollectionViewFlowLayout = {
            $0.scrollDirection = .vertical
            $0.minimumLineSpacing = 8
            $0.minimumInteritemSpacing = 8
            return $0
        }(UICollectionViewFlowLayout())
        
        
        private lazy var collectionView: UICollectionView = {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.backgroundColor = .white
            $0.dataSource = self
            $0.delegate = self
            $0.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)
            return $0
        }(UICollectionView(frame: .zero, collectionViewLayout: self.layout))
        
        override func viewDidLoad() {
            super.viewDidLoad()
            self.view.tintColor = UIColor(ciColor: .init(color: colorSet))
            self.view.backgroundColor = .systemGray6
            self.title = "Photo Gallery"
            self.navigationItem.backButtonTitle = "Back"
            self.navigationController?.navigationBar.isHidden = false
            setupLayout()
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            navigationController?.setNavigationBarHidden(false, animated: animated)
        }
        private func setupLayout() {
            view.addSubview(collectionView)
            
            NSLayoutConstraint.activate([
                collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
        }
    }

    // UICollectionViewDataSource
    extension PhotosViewController: UICollectionViewDataSource {
        func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return photosModel.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier, for: indexPath) as! PhotosCollectionViewCell
            cell.setupCell(photosModel[indexPath.row])
            return cell
        }
    }

    // MARK: - UICollectionViewDelegateFlowLayout
    extension PhotosViewController: UICollectionViewDelegateFlowLayout {
        private var sideInset: CGFloat { return 8 }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let width = (collectionView.bounds.width - sideInset * 4) / 3
            return CGSize(width: width, height: width)
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            sideInset
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            UIEdgeInsets(top: sideInset, left: sideInset, bottom: sideInset, right: sideInset)
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            sideInset
        }
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            print(indexPath.section, indexPath.item)
        }
}
