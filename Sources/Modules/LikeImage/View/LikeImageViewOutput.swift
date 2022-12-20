//
//  File.swift
//  
//
//  Created by Vadim Igdisanov on 06.12.2022.
//

import DataKit
import CoreData
import Models
import UIKit

protocol LikeImageViewOutput: AnyObject {
    func viewDidLoad()
    func deleteImage(image: ImageInfo)
    func getImages(with: NSFetchedResultsControllerDelegate)
    func openDetailInfo(vc: UIViewController, image: ImageDataInfo)
}
