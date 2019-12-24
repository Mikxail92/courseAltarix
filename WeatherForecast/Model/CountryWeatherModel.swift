//
//  CountryWeatherModel.swift
//  WeatherForecast
//
//  Created by Zateev on 19.12.2019.
//  Copyright © 2019 Zateev. All rights reserved.
//

import RealmSwift

class CountryWeatherModel: Object, Codable {
    
    @objc dynamic var country = ""
}
