//
//  Day.swift
//  WeatherForecast
//
//  Created by Zateev on 19.12.19.
//  Copyright © 2019 Zateev. All rights reserved.
//

import Foundation

struct Day {
    var tempMin: Double
    var tempMax: Double
    var date: Date
    var image: String
    var tempMinandMaxString: String {
        return  "\(Int(tempMin) - 273)C° / \(Int(tempMax) - 273)C°"
    }
}
