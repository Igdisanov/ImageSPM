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
    
    func fetchImages(searchTerm: String?, completion: @escaping ([ImageData]?) -> ())   {
        self.networkDataFetcher.fetchImages(searchTerm: searchTerm) { (fetchData) in
            if searchTerm != nil {
                guard let fetchedImages = fetchData as? ImageResults  else {return}
                DispatchQueue.main.async {
                    completion(fetchedImages.results)
                }
            } else {
                guard let images = fetchData as? [ImageData]  else {return}
                DispatchQueue.main.async {
                    completion(images)
                }
            }
        }
    }
}
