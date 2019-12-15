

import Foundation

struct WeatherFiveDayModel: Codable {
    let city: CityWeatherModel
    let list: [ListWeatherModel]
}

struct CityWeatherModel: Codable{
    let name: String
}

struct ListWeatherModel:Codable{
    let main: MainWeatherModel
    let weather: [WeatherModel]
    let dt_txt: String
    
    var dateWeatherString: String {
        return dt_txt
    }
}
