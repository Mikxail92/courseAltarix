//
//  ListWeatherModel.swift
//  WeatherForecast
//
//  Created by Zateev on 19.12.2019.
//  Copyright © 2019 Zateev. All rights reserved.
//

import RealmSwift

class ListWeatherModel: Object, Codable {
    
    @objc  dynamic var main: MainWeatherModel?
    @objc  dynamic var dateWeather: Date?
    var weather = List<WeatherModel>()
    
    enum CodingKeys: String, CodingKey {
        case dateWeather = "dt_txt"
        case main
        case weather
    }
}
