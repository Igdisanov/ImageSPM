//
//  NetworkDataFetcher.swift
//  
//
//  Created by Vadim Igdisanov on 09.12.2022.
//

import Foundation
import Models

open class NetworkDataFetcher {
    public init(){}
    
    var netwokService = NetworkService()
    
    public func fetchImages(searchTerm: String?, completion: @escaping (Any?) -> ()) {
        
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
