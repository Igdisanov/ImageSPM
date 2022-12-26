//
//  File.swift
//  
//
//  Created by Vadim Igdisanov on 06.12.2022.
//


import UIKit

protocol AllImageViewOutput: AnyObject {
    func viewDidLoad()
    func requestImage(searchTerm: String?)
    func savePhotos(photos: [ImageDataInfo])
    func openDetailInfo(vc: UIViewController, image: ImageDataInfo)
}
