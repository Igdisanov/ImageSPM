//
//  ImageResults.swift
//  
//
//  Created by Vadim Igdisanov on 09.12.2022.
//

import Foundation

struct ImageResults: Decodable {
    let total: Int
    let results: [ImageData]
}

struct ImageData: Decodable {
    let width: Int
    let height: Int
    let likes: Int
    let urls: [URLKing.rawValue: String]
    let user: [User.rawValue: String]
    
    enum URLKing: String {
        case raw
        case full
        case regular
        case small
        case thumb
    }
    
    enum User: String {
        case name
        case username
    }
}
