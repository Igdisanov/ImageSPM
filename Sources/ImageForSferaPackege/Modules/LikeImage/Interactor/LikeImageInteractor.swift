//
//  File.swift
//  
//
//  Created by Vadim Igdisanov on 06.12.2022.
//

import CoreData
import UIKit

@available(iOS 13.0, *)
final class LikeImageInteractor {
    
    weak var output: LikeImageInteractorOutput?
}

//MARK: LikeImageInteractorInput

@available(iOS 13.0, *)
extension LikeImageInteractor: LikeImageInteractorInput {
    
    func getImage(with: NSFetchedResultsControllerDelegate) -> EmployeeProvider {
        return fetchImage(with: with)
    }
    
    func deleteImage(image: ImageInfo) {
        self.deleteData(photo: image)
    }
}

//MARK: - CoreData

@available(iOS 13.0, *)
extension LikeImageInteractor {
    
    private func getContext() -> NSManagedObjectContext {
        let coreDataStack = CoreDataStack()
        return coreDataStack.persistentContainer.viewContext
    }
    
    private func fetchImage(with: NSFetchedResultsControllerDelegate) -> EmployeeProvider {
        let provider = EmployeeProvider(with: with)
        return provider
    }
    
    private func deleteData(photo: ImageInfo) {
        let context = getContext()
        let fetchRequest: NSFetchRequest<ImageInfo> = ImageInfo.fetchRequest()
        if let objects = try? context.fetch(fetchRequest) {
            for object in objects {
                if object.id == photo.id {
                    context.delete(object)
                }
            }
        }
        do {
            try context.save()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
}
