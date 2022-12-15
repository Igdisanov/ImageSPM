//
//  ImageInfo+CoreDataProperties.swift
//  ImageForSfera
//
//  Created by Vadim Igdisanov on 15.12.2022.
//
//

import Foundation
import CoreData


extension ImageInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ImageInfo> {
        return NSFetchRequest<ImageInfo>(entityName: "ImageInfo")
    }

    @NSManaged public var height: Int32
    @NSManaged public var likes: Int32
    @NSManaged public var regular: String?
    @NSManaged public var small: String?
    @NSManaged public var width: Int32

}

extension ImageInfo : Identifiable {

}
