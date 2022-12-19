//
//  File.swift
//  
//
//  Created by Vadim Igdisanov on 06.12.2022.
//

import DataKit
import CoreData

protocol LikeImageViewOutput: AnyObject {
    func viewDidLoad()
    func deleteImage(image: ImageInfo)
    func getImages(with: NSFetchedResultsControllerDelegate)
}
