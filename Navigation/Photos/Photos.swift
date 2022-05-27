//
//  Photos.swift
//  Navigation
//
//  Created by Саша on 23.05.2022.
//

import UIKit

var photoGalery: [UIImage] = {
    var photoGalery = [UIImage]()
    for i in 1...21 {
        photoGalery.append(UIImage(named: "\(i)")!)
    }
    return photoGalery
}()
