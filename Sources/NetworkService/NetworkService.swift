//
//  NetworkService.swift
//  
//
//  Created by Vadim Igdisanov on 09.12.2022.
//

import Foundation

open class NetworkService {
    public init() {
        
    }
    public func request(searchTerm: String?, completion: @escaping (Data?, URLResponse?, Error?)-> Void) {
        let parameters = self.prepareParaments(searchTerm: searchTerm)
        let url = self.url(searchTerm: searchTerm, params: parameters)
        
        var request = URLRequest(url: url)
        request.httpMethod = "get"
        let task = createDataTask(from: request, completion: completion)
        task.resume()
    }
    
    private func prepareParaments(searchTerm: String?) -> [String: String] {
        var parameters = [String: String]()
        parameters["client_id"] = "PXbu63QhIUpJ8GmrlH_rWhOpiIV0qLGhim8v8IZUzOg"
        parameters["query"] = searchTerm
        parameters["page"] = String(1)
        parameters["per_page"] = String(30)
        return parameters
    }
    
    private func url(searchTerm: String?, params: [String: String]) -> URL {
        var components = URLComponents()
        
        components.scheme = "https"
        components.host = "api.unsplash.com"
        components.path = searchTerm != nil ? "/search/photos" : "/photos"
        components.queryItems = params.map { URLQueryItem(name: $0, value: $1) }
        return components.url!
    }
    
    private func createDataTask(from request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request) { (data, responce, error) in
            DispatchQueue.main.async {
                completion(data, responce, error)
            }
        }
    }
    
}
