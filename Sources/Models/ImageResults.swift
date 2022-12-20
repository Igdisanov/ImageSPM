//
//  ImageResults.swift
//  
//
//  Created by Vadim Igdisanov on 09.12.2022.
//

import Foundation

public struct ImageResults: Decodable {
    public var total: Int
    public var results: [ImageDataInfo]
}

public class ImageDataInfo: Decodable {
    public let id: String?
    public let width: Int?
    public let height: Int?
    public let color: String?
    public let likes: Int?
    public let urls: [URLKing.RawValue:String]?
    
    
    public init(id: String, color: String, urls: [URLKing.RawValue:String], height: Int, width: Int, likes: Int ) {
        self.id = id
        self.color = color
        self.urls = urls
        self.height = height
        self.width = width
        self.likes = likes
    }
    
    public enum URLKing: String {
        case raw
        case full
        case regular
        case small
        case thumb
    }
}
