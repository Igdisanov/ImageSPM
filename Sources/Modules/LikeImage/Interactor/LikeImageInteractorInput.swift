//
//  File.swift
//  
//
//  Created by Vadim Igdisanov on 06.12.2022.
//

import DataKit
import CoreData

@available(iOS 13.0, *)
protocol LikeImageInteractorInput {
    func deleteImage(image: ImageInfo)
    func getImage(with: NSFetchedResultsControllerDelegate) -> EmployeeProvider
}
