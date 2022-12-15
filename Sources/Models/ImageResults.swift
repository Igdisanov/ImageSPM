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

public struct ImageDataInfo: Decodable {
    public let width: Int
    public let height: Int
    public let likes: Int
    public let urls: [URLKing.RawValue:String]
    
    public enum URLKing: String {
        case raw
        case full
        case regular
        case small
        case thumb
    }
}
