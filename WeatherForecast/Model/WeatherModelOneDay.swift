//
//  WeatherModel.swift
//  WeatherForecast
//
//  Created by 123 on 10.12.19.
//  Copyright © 2019 Zateev. All rights reserved.
//

import Foundation

struct WeatherForecastModel: Codable {
    let weather: [WeatherModel]
    let main: MainWeatherModel
    let wind: WindWeatherModel
    let id: Int
    let name: String
    let sys: CountryWeatherModel
}

struct CountryWeatherModel:Codable {
    let country: String
}

struct WeatherModel: Codable {
    let main: String
    let description: String
    let icon: String
}

struct MainWeatherModel: Codable {
    let temp: Double
    let pressure:Int
    let humidity: Int
    let temp_min: Double
    let temp_max: Double
    
    var pressureString: String {
        return "Давление \(Double(pressure) * 0.75) мм р.с."
    }
    var tempString: String {
        return "\( Int(temp) - 273 ) С°"
    }
    var humidityString: String {
        return "Влажность  \(humidity)  %"
    }
}
struct WindWeatherModel: Codable {
    let speed: Double
    var speedString: String {
        return "Cкорость ветра \(speed)  m/c"
    }
}

// модель на 5 дней

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






