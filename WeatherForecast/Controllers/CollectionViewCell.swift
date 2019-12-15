//
//  CollectionViewCell.swift
//  WeatherForecast
//
//  Created by 123 on 11.12.19.
//  Copyright © 2019 Zateev. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var dateWeather: UILabel!
    @IBOutlet weak var iweatherImage: UIImageView!
    
    func configuration(weatherFiveDay: WeatherFiveDayModel,indexPath: IndexPath){
        
        let weather  = weatherFiveDay.list
        
        var  tempMaxArray = [Double]()
        var  supportArray1 = [Double]()
        
        var tempMinArray = [Double]()
        var supportArray2 = [Double]()
        
        var dateArray = [String]()
        var supportDateArray = [String]()
        
        // создаю массив всех значегий temp мин и макс, дата
        
        for i in weather {
            supportArray1.append(i.main.temp_max)
            supportArray2.append(i.main.temp_min)
            supportDateArray.append(i.dateWeatherString)
        }
        var n = 0
        var m = 7
        for i in stride(from: 7, to: weather.count  , by: 8){
            
            dateArray.append(supportDateArray[i])
            let k = supportArray2[n...m]
            let l = k.min()
            let g =  supportArray1[n...m]
            let b =  g.max()
            tempMaxArray.append(b!)
            tempMinArray.append(l!)
            n = n + 8
            m = m + 8
        }
        
        let averageTempMin = "\(Int(tempMinArray[indexPath.row]) - 273) C°"
        let averageTempMax = "\(Int(tempMaxArray[indexPath.row]) - 273) C°"
        // расчет даты
        
        let dateWeatherString = dateArray[indexPath.row]
        
        let dateFormatter = DateFormatter ()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss "
        let dateWeather = dateFormatter.date(from:dateWeatherString )
        let calendar = Calendar.current
        let weekday = calendar.component(.weekday , from: dateWeather!)
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
        let dayString = "\(calendar.component(.day , from: dateWeather!))"
        let monthString = "\( calendar.component(.month , from: dateWeather!))"
        
        self.dateWeather.text =  weekdayString  + " " + dayString + "." + monthString
        
        self.tempLabel.text = averageTempMin + " / " + averageTempMax
    }
}
