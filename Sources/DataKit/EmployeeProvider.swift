//
//  EmployeeProvider.swift
//  
//
//  Created by Vadim Igdisanov on 19.12.2022.
//

import Foundation
import CoreData

@available(iOS 13.0, *)
open class EmployeeProvider {
    private weak var fetchedResultControllerDelegate: NSFetchedResultsControllerDelegate?
    
    public init(with fetchedResultControllerDelegate: NSFetchedResultsControllerDelegate) {
        self.fetchedResultControllerDelegate = fetchedResultControllerDelegate
    }
    
    public lazy var fetchedResultController: NSFetchedResultsController<ImageInfo> = {
        let coreData = CoreDataStack()
        let fetchRequest: NSFetchRequest<ImageInfo> = ImageInfo.fetchRequest()
        fetchRequest.fetchBatchSize = 20
        
        let heightSortDescriptor = NSSortDescriptor(key: "height", ascending: true)
        let idSortDescriptor = NSSortDescriptor(key: "id", ascending: true)
        let likesSortDescriptor = NSSortDescriptor(key: "likes", ascending: true)
        let regularSortDescriptor = NSSortDescriptor(key: "regular", ascending: true)
        let smallSortDescriptor = NSSortDescriptor(key: "small", ascending: true)
        let widthSortDescriptor = NSSortDescriptor(key: "width", ascending: true)
        
        fetchRequest.sortDescriptors = [heightSortDescriptor,
                                        idSortDescriptor,
                                        likesSortDescriptor,
                                        regularSortDescriptor,
                                        smallSortDescriptor,
                                        widthSortDescriptor]
        
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: coreData.persistentContainer.viewContext, sectionNameKeyPath: nil, cacheName: nil)
        
        controller.delegate = fetchedResultControllerDelegate
        
        do {
            try controller.performFetch()
        } catch {
            debugPrint(error)
        }
        
        return controller
    }()
}
