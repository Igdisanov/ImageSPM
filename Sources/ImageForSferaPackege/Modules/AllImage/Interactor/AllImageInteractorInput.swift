//
//  File.swift
//  
//
//  Created by Vadim Igdisanov on 06.12.2022.
//


import CoreData

protocol AllImageInteractorInput: AnyObject {
    func fetchImages(searchTerm: String?, completion: @escaping ([ImageDataInfo]?) -> ())
    func savePhotos(photos: [ImageDataInfo])
    func getPhotos()
}
