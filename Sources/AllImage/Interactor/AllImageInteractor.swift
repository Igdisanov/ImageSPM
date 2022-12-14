//
//  File.swift
//  
//
//  Created by Vadim Igdisanov on 06.12.2022.
//
import Foundation
import NetworkService
import Models

class AllImageInteractor {
    
    // MARK: - Public Properties
    weak var output: AllImageInteractorOutput!
    var networkDataFetcher = NetworkDataFetcher()
}

//MARK: - AllImageInteractorInput

extension AllImageInteractor: AllImageInteractorInput {
    
    func fetchSearchImages(searchTerm: String, completion: @escaping ([ImageData]?) -> ())   {
        self.networkDataFetcher.fetchImages(searchTerm: searchTerm) { (searchResults) in
            guard let fetchedImage = searchResults else {return}
            DispatchQueue.main.async {
                completion(fetchedImage.results)
            }
        }
    }
}
