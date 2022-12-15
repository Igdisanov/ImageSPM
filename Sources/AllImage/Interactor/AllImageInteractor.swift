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
    var savedPhotos: [ImageInfo] = []
}

//MARK: - AllImageInteractorInput

@available(iOS 13.0, *)
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
    
    func savePhotos(photos: [ImageDataInfo]) {
        for photo in photos {
            self.savePhoto(photo: photo)
        }
    }
    
    func getPhotos() {
        self.getData()
        print(savedPhotos.first?.small)
    }
    
}

//MARK: - CoreData

@available(iOS 13.0, *)
extension AllImageInteractor {
    
    private func getContext() -> NSManagedObjectContext {
        let coreDataStack = CoreDataStack()
        return coreDataStack.persistentContainer.viewContext
    }
    
    @nonobjc func savePhoto(photo: ImageDataInfo) {
        let context = getContext()
        guard let entity = NSEntityDescription.entity(forEntityName: "ImageInfo", in: context) else {return}
        let photoObject = ImageInfo(entity: entity, insertInto: context)
        photoObject.likes = Int32(photo.likes)
        photoObject.height = Int32(photo.height)
        photoObject.width = Int32(photo.width)
        photoObject.regular = photo.urls["regular"]
        photoObject.small = photo.urls["small"]
        
        
        do {
            try context.save()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
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
    
    
}
