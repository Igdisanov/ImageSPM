//
//  File.swift
//  
//
//  Created by Vadim Igdisanov on 06.12.2022.
//

import NetworkService
import Models
import CoreData
import UIKit
import DataKit


class AllImageInteractor {
    
    // MARK: - Public Properties
    weak var output: AllImageInteractorOutput!
    var networkDataFetcher = NetworkDataFetcher()
}

//MARK: - AllImageInteractorInput

extension AllImageInteractor: AllImageInteractorInput {
    
    func fetchImages(searchTerm: String?, completion: @escaping ([ImageDataInfo]?) -> ())   {
        self.networkDataFetcher.fetchImages(searchTerm: searchTerm) { (fetchData) in
            if searchTerm != nil {
                guard let fetchedImages = fetchData as? ImageResults  else {return}
                DispatchQueue.main.async {
                    completion(fetchedImages.results)
                }
            } else {
                guard let images = fetchData as? [ImageDataInfo]  else {return}
                DispatchQueue.main.async {
                    completion(images)
                }
            }
        }
    }
}

//MARK: - CoreData

@available(iOS 13.0, *)
@objc(ImageInfo)
extension AllImageInteractor {
    
    private func getContext() -> NSManagedObjectContext {
        let coreDataStack = UIApplication.shared.delegate as! CoreDataStack
        return coreDataStack.persistentContainer.viewContext
    }
    
    @nonobjc func savePhoto(photo: ImageDataInfo) {
        let context = getContext()
        guard let entity = NSEntityDescription.entity(forEntityName: "ImageInfo", in: context) else {return}
        let photoObject = ImageInfo(entity: entity, insertInto: context)
        photoObject.likes = photo.likes
        photoObject.height = photo.height
        photoObject.width = photo.width
        photoObject.regular = photo.urls["regular"]
        photoObject.small = photo.urls["small"]
        
        
        do {
            try context.save()        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    
}
