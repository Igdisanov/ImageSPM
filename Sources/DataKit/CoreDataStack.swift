//
//  CoreDataStack.swift
//  
//
//  Created by Vadim Igdisanov on 15.12.2022.
//

import UIKit
import CoreData

@available(iOS 13.0, *)
open class CoreDataStack: NSObject {
    public lazy var persistentContainer: NSPersistentContainer = {
        
        let bundle = Bundle.module
        guard let modelURL = bundle.url(forResource: "ImageForSfera", withExtension: ".momd"),
              let model = NSManagedObjectModel(contentsOf: modelURL) else { return (NSPersistentContainer())
        }
        
        let container = NSPersistentCloudKitContainer(name: "ImageForSfera", managedObjectModel: model)
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    public func saveContext () {
        let context = persistentContainer.viewContext
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

