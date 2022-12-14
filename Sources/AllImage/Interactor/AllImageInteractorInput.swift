//
//  File.swift
//  
//
//  Created by Vadim Igdisanov on 06.12.2022.
//

import Models

protocol AllImageInteractorInput {
    func fetchImages(searchTerm: String?, completion: @escaping ([ImageData]?) -> ())
}
