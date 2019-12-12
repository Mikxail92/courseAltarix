//
//  WeatherModel.swift
//  WeatherForecast
//
//  Created by 123 on 10.12.19.
//  Copyright © 2019 Zateev. All rights reserved.
//

import Foundation

struct WeatherForecast: Codable {
    let weather: [Weather]
    let main: Main
    let wind: Wind
    let id: Int
    let name: String
}

struct Weather: Codable {
    let main: String
    let description: String
    let icon: String
}

struct Main: Codable {
    let temp: Double
    let pressure:Int
    let humidity: Int
    let temp_min: Double
    let temp_max: Double
//    var pressureString: String{
//       return "Давление \(Double(weatherOneDay.main.pressure) * 0.75) мм р.с."
//    }
}

struct Wind: Codable {
    let speed: Double
}

// модель на 5 дней

struct WeatherFiveDay: Codable {
    let city: City
    let list: [List]
}

struct City: Codable{
    let name: String
}

struct List:Codable{
    let main: Main
    let weather: [Weather]
    let dt_txt: String
}



//https://api.openweathermap.org/data/2.5/forecast?q=samara&APPID=51b90348b887a3ff4799547a1d511b3f
//http://api.openweathermap.org/data/2.5/forecast?q=samara&APPID=51b90348b887a3ff4799547a1d511b3f





