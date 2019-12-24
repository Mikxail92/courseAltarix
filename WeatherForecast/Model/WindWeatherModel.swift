//
//  WindWeatherModel.swift
//  WeatherForecast
//
//  Created by Zateev on 19.12.2019.
//  Copyright © 2019 Zateev. All rights reserved.
//

import RealmSwift

class WindWeatherModel: Object, Codable {
    
    @objc dynamic var speed = 0.0
    
    var speedString: String {
        return "Cкорость ветра \(Int(speed))  m/c"
    }
}
