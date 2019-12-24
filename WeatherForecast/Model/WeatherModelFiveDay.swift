//
//  WeatherFiveDayModel.swift
//  WeatherForecast
//
//  Created by  Zateev on 18.12.2019.
//  Copyright © 2019 Zateev. All rights reserved.
//

import  RealmSwift

class WeatherFiveDayModel: Object, Codable {
    
    var list = List<ListWeatherModel>()
    
    @objc  dynamic  var id: String? = ""
    @objc  dynamic var city: CityWeatherModel?
    
    public override static func primaryKey() -> String? {
        return "id"
    }
}
