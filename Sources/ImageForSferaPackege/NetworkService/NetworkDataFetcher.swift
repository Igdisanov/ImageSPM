//
//  NetworkDataFetcher.swift
//  
//
//  Created by Vadim Igdisanov on 09.12.2022.
//

import Foundation

protocol NetworkFetcherProtocol {
    func fetchImages(searchTerm: String?, completion: @escaping (Any?) -> ())
}

final class NetworkDataFetcher: NetworkFetcherProtocol {
    
    var netwokService: NetworkProtocol
    
    init(){
        self.netwokService = NetworkService()
    }
    
    func fetchImages(searchTerm: String?, completion: @escaping (Any?) -> ()) {
        
        netwokService.request(searchTerm: searchTerm) { (data, request, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }
            if searchTerm != nil {
                let decode = self.decodeJSON(type: ImageResults.self, from: data)
                completion(decode)
            } else {
                let decode = self.decodeJSON(type: [ImageDataInfo].self, from: data)
                completion(decode)
            }
        }
    }
        
    func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        
        guard let data = from else {return nil}
        
        do {
            let objects = try decoder.decode(type.self, from: data)
            return objects
        } catch let jsonError {
            print("JSONE", jsonError)
            return nil
        }
    }
}
