//
//  Net.swift
//  WeatherForecast
//
//  Created by 123 on 10.12.19.
//  Copyright © 2019 Zateev. All rights reserved.
//

import Foundation

class Networking {
    
    static func fetchData<T:Codable>(url : String,completion: @escaping (_ weather: T?, _ error: Error?)->() ){
        
        guard let Url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: Url) { (data, response, error) in
            
            guard let data = data else {return}
            
            do {
                let weather = try JSONDecoder().decode(T.self , from: data)
                completion(weather,nil)
            } catch let error{
                completion(nil, error)
            }
            
            }.resume()
    }
}



