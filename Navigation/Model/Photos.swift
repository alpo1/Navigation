//
//  Photos.swift
//  Navigation
//
//  Created by Саша on 23.05.2022.
//

import UIKit

struct PhotosModel {
    var author: String
    var image: String
    
    static func makeMockModel() -> [PhotosModel] {
        var model = [PhotosModel]()
        model.append(PhotosModel(author: "Party Cat", image: "01"))
        model.append(PhotosModel(author: "Party Cat", image: "02"))
        model.append(PhotosModel(author: "Party Cat", image: "03"))
        model.append(PhotosModel(author: "Party Cat", image: "04"))
        model.append(PhotosModel(author: "Party Cat", image: "05"))
        model.append(PhotosModel(author: "Party Cat", image: "06"))
        model.append(PhotosModel(author: "Party Cat", image: "07"))
        model.append(PhotosModel(author: "Party Cat", image: "08"))
        model.append(PhotosModel(author: "Party Cat", image: "09"))
        model.append(PhotosModel(author: "Party Cat", image: "10"))
        model.append(PhotosModel(author: "Party Cat", image: "11"))
        model.append(PhotosModel(author: "Party Cat", image: "12"))
        model.append(PhotosModel(author: "Party Cat", image: "13"))
        model.append(PhotosModel(author: "Party Cat", image: "14"))
        model.append(PhotosModel(author: "Party Cat", image: "15"))
        model.append(PhotosModel(author: "Party Cat", image: "16"))
        model.append(PhotosModel(author: "Party Cat", image: "17"))
        model.append(PhotosModel(author: "Party Cat", image: "18"))
        model.append(PhotosModel(author: "Party Cat", image: "19"))
        model.append(PhotosModel(author: "Party Cat", image: "20"))
        model.append(PhotosModel(author: "Party Cat", image: "21"))
   return model
    }
}
