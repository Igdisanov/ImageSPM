//
//  File.swift
//  
//
//  Created by Vadim Igdisanov on 06.12.2022.
//


import CoreData

@available(iOS 13.0, *)
protocol LikeImageInteractorInput: AnyObject {
    func deleteImage(image: ImageInfo)
    func getImage(with: NSFetchedResultsControllerDelegate) -> EmployeeProvider
}
