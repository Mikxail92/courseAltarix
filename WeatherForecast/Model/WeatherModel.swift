//
//  Fil.swift
//  WeatherForecast
//
//  Created by Иерихон on 19.12.2019.
//  Copyright © 2019 Zateev. All rights reserved.
//

import RealmSwift

class WeatherModel: Object, Codable {
    @objc dynamic var main = ""
    @objc dynamic var descriptionWeather: String
    @objc dynamic var icon = ""
    
    enum CodingKeys: String, CodingKey {
        case main
        case descriptionWeather = "description"
        case icon
    }
}
