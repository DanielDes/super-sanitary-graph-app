//
//  Networking.swift
//  SuperSanitaryGraphApp
//
//  Created by L Daniel De San Pedro on 17/12/20.
//

import Foundation
import Alamofire


struct Networking{
    static let apiURL = URL(string: "https://us-central1-bibliotecadecontenido.cloudfunctions.net/helloWorld")
    
    static func fetchData<T:Decodable>(fromURL url: URL, completionHandler: @escaping (T) -> ()){
        AF.request(url, method: .get, parameters: nil).response{ response in
            if let error = response.error{
                print("Error \(error)")
                return
            }
            
            guard let data = response.data else {
                print("Error fetching the data")
                return
            }
            
            do {
                let model = try JSONDecoder().decode(T.self, from: data)
                completionHandler(model)
            } catch let error {
                print("Error decoding :( \(error)")
            }
            
        }
        
    }
}


