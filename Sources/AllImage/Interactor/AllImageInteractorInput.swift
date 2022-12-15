//
//  File.swift
//  
//
//  Created by Vadim Igdisanov on 06.12.2022.
//

import Models
import CoreData

protocol AllImageInteractorInput {
    func fetchImages(searchTerm: String?, completion: @escaping ([ImageData]?) -> ())
}
