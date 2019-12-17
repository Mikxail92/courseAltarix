

import Foundation


let urlKey = "&APPID=51b90348b887a3ff4799547a1d511b3f"
let urlDomein = "https://api.openweathermap.org/data/2.5/"

enum UrlCountDay: String {
    case urlOneDay = "weather?q="
    case urlFiveDay = "forecast?q="
}

class Networking {
        
    static func fetchData<T:Codable>( url : String  ,completion: @escaping (_ weather: T?, _ error: Error?)->() ){
        
        guard let Url = URL(string: urlDomein + url + urlKey) else { return }
        
        URLSession.shared.dataTask(with: Url) { (data, response, error) in
            
            guard let data = data else {return}
            
            do {
                let weather = try JSONDecoder().decode(T.self , from: data)
                DispatchQueue.main.async {
                completion(weather,nil)
                }
            } catch let error{
                DispatchQueue.main.async {
                completion(nil, error)
                }
            }
            
            }.resume()
    }
}



