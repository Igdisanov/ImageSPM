//
//  File.swift
//  
//
//  Created by Vadim Igdisanov on 06.12.2022.
//


import CoreData
import UIKit


final class AllImageInteractor {
    
    // MARK: - Public Properties
    weak var output: AllImageInteractorOutput?
    var networkDataFetcher: NetworkFetcherProtocol
    
    init(networkDataFetcher: NetworkFetcherProtocol) {
        self.networkDataFetcher = networkDataFetcher
    }
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
        photoObject.likes = Int32(photo.likes ?? 0)
        photoObject.height = Int32(photo.height ?? 100)
        photoObject.width = Int32(photo.width ?? 100)
        photoObject.regular = photo.urls?["regular"]
        photoObject.small = photo.urls?["small"]
        photoObject.id = photo.id
        photoObject.color = photo.color
        photoObject.name = photo.user?.name
        photoObject.medium = photo.user?.profile_image?["large"]
        
        
        do {
            try context.save()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
}
