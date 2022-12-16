//
//  File.swift
//  
//
//  Created by Vadim Igdisanov on 06.12.2022.
//

import DataKit

protocol LikeImageViewInput: AnyObject {
    func viewDidLoad()
    func setSavedImages(images: [ImageInfo])
}
