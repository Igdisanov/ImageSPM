//
//  File.swift
//  
//
//  Created by Vadim Igdisanov on 06.12.2022.
//

import DataKit

protocol LikeImageViewOutput: AnyObject {
    func viewDidLoad()
    func viewWillAppear()
    func deleteImage(image: ImageInfo)
}
