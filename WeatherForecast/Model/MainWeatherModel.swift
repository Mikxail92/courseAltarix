//
//  MainWeatherModel.swift
//  WeatherForecast
//
//  Created by Zateev on 19.12.2019.
//  Copyright © 2019 Zateev. All rights reserved.
//

import RealmSwift

class MainWeatherModel: Object, Codable {
    
    @objc dynamic var temp = 0.0
    @objc dynamic var pressure = 0.0
    @objc dynamic var humidity = 0
    @objc dynamic var tempMin = 0.0
    @objc dynamic var tempMax = 0.0
    
    var pressureString: String {
        return "Давление \(Int(pressure * 0.75)) мм р.с."
    }
    var tempString: String {
        return "\( Int(temp) - 273 ) С°"
    }
    var humidityString: String {
        return "Влажность  \(humidity)  %"
    }
    
    enum CodingKeys: String, CodingKey {
        case temp
        case humidity
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
    }
}
