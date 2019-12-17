//
//  Tempminmsx.swift
//  WeatherForecast
//
//  Created by 123 on 17.12.19.
//  Copyright © 2019 Zateev. All rights reserved.
//

import Foundation
import UIKit

func q1111(weatherFiveDay: WeatherFiveDayModel, indexPath: IndexPath){
    
    let weather  = weatherFiveDay.list
    
/*2*/   var  tempMaxArray = [Double]()
    var  supportArray1 = [Double]()
    
/*1*/   var tempMinArray = [Double]()
    var supportArray2 = [Double]()
    
    var dateArray = [String]()
    var supportDateArray = [String]()
    
/*3*/   var imageInFiveDayArray = [String]()
    var supportImageInFiveDayArray = [String]()
    
    // создаю массив всех значегий t min и t maxм, дата,картинка погоды
    
    for i in weather {
        
        let rr = i.weather[0].icon
        
        supportImageInFiveDayArray.append(rr)
        supportArray1.append(i.main.temp_max)
        supportArray2.append(i.main.temp_min)
        supportDateArray.append(i.dateWeatherString)
    }
    // СЧЁТЧИКИ
    var n = 0
    var m = 7
    
    for i in stride(from: 7, to: weather.count , by: 8) {
        
        let icon = supportImageInFiveDayArray.remove(at: i-4)
        imageInFiveDayArray.append(icon)
        
        dateArray.append(supportDateArray[i])
        let arrayTempMinOneDay = supportArray2[n...m]
        let tempMinOneDay = arrayTempMinOneDay.min()
        let arrayTempMaxOneDay =  supportArray1[n...m]
        let tempMaxOneDay =  arrayTempMaxOneDay.max()
        tempMaxArray.append(tempMaxOneDay!)
        tempMinArray.append(tempMinOneDay!)
        n = n + 8
        m = m + 8
    }
    
    
    // расчет даты
    let dateWeatherString = dateArray[indexPath.row]
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss "
    let dateWeather = dateFormatter.date(from:dateWeatherString)
    let calendar = Calendar.current
    let weekday = calendar.component(.weekday, from: dateWeather!)
    var weekdayString = String()
    switch weekday {
    case 1:
        weekdayString = "Воск."
    case 2:
        weekdayString = "Пон."
    case 3:
        weekdayString = "Вт."
    case 4:
        weekdayString = "Ср."
    case 5:
        weekdayString = "Чет."
    case 6:
        weekdayString = "Пят."
    case 7:
        weekdayString = "Суб."
    default:
        break
    }
    let dayString = "\(calendar.component(.day, from: dateWeather!))"
    let monthString = "\(calendar.component(.month, from: dateWeather!))"
    
    
}

