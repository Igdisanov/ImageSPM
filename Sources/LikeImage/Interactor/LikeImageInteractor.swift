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
    func getImage() -> [ImageInfo] {
        self.getData()
        return savedPhotos
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
    
    private func getData() {
        let context = getContext()
        let fetchRequest: NSFetchRequest<ImageInfo> = ImageInfo.fetchRequest()
        do {
            savedPhotos = try context.fetch(fetchRequest)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
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
