//
//  WeatherForecastOneDayModel.swift
//  WeatherForecast
//
//  Created by  Zateev on 18.12.2019.
//  Copyright © 2019 Zateev. All rights reserved.
//

import RealmSwift
class WeatherForecastOneDayModel: Object, Codable {
    
    var weather = List<WeatherModel>()
    
    @objc dynamic var main: MainWeatherModel?
    @objc dynamic var wind: WindWeatherModel?
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    @objc dynamic var sys: CountryWeatherModel?
    
    
    public override static func primaryKey() -> String? {
        return "name"
    }
}
