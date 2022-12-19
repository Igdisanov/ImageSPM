//
//  File.swift
//  
//
//  Created by Vadim Igdisanov on 06.12.2022.
//
import Models
import CoreData
import UIKit
import DataKit

class LikeImageInteractor {
    
    weak var output: LikeImageInteractorOutput!
    var savedPhotos: [ImageInfo] = []
}

     //MARK: LikeImageInteractorInput

@available(iOS 13.0, *)
extension LikeImageInteractor: LikeImageInteractorInput {
    
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
