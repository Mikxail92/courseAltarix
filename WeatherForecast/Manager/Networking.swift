

import Foundation

enum UrlCollection: String {
    case urlOneDay = "weather?q="
    case urlFiveDay = "forecast?q="
    case urlKey = "&APPID=51b90348b887a3ff4799547a1d511b3f"
    case urlDomein = "https://api.openweathermap.org/data/2.5/"
}

class Networking {
    
        
    static func fetchData<T:Codable>( url : String  ,completion: @escaping (_ weather: T?, _ error: Error?)->() ){
        
        guard let Url = URL(string: UrlCollection.urlDomein.rawValue + url + UrlCollection.urlKey.rawValue) else { return }
        
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



