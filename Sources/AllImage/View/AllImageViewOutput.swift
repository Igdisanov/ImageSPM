//
//  File.swift
//  
//
//  Created by Vadim Igdisanov on 06.12.2022.
//

import Models

protocol AllImageViewOutput: AnyObject {
    func viewDidLoad()
    func requestImage(searchTerm: String?)
    func savePhotos(photos: [ImageDataInfo])
    func getPhotos()
}
