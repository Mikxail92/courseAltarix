//
//  WeatherViewController.swift
//  WeatherForecast
//
//  Created by Zateev on 16.12.19.
//  Copyright © 2019 Zateev. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    var weatherOneDay: WeatherForecastOneDayModel!
    var weatherFiveDay: WeatherFiveDayModel!
    private var days = [Day]()
    
    @IBOutlet weak private var viewOneDay: UIView!
    @IBOutlet weak private var viewFiveDay: UIView!
    
    @IBOutlet weak private var tableViewFiveDay: UITableView!
    @IBOutlet weak private var segment: UISegmentedControl!
    
    @IBOutlet weak private var weatherIconImage: UIImageView!
    @IBOutlet weak private var pressureLabel: UILabel!
    @IBOutlet weak private var humidityLabel: UILabel!
    @IBOutlet weak private var speedWindLabel: UILabel!
    @IBOutlet weak private var tempLabel: UILabel!
    
    
    @IBAction func actionSegment(_ sender: UISegmentedControl) {
        switch segment.selectedSegmentIndex {
        case 0:
            viewOneDay.isHidden = false
            viewFiveDay.isHidden = true
        case 1:
            viewOneDay.isHidden = true
            viewFiveDay.isHidden = false
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDateFiveDay(weatherFiveDay: weatherFiveDay)
        installLabel()
        tableViewFiveDay.allowsSelection = false
    }
    
    private func installLabel() {
        if let countryString = weatherOneDay.sys?.country {
            title = weatherOneDay.name + " " + countryString
        }
        pressureLabel.text = weatherOneDay.main?.pressureString
        tempLabel.text = weatherOneDay.main?.tempString
        humidityLabel.text = weatherOneDay.main?.humidityString
        speedWindLabel.text = weatherOneDay.wind?.speedString
        let image = weatherOneDay.weather[0].icon
        weatherIconImage.image = UIImage(named: image)
        
    }
    
    private func getDateFiveDay(weatherFiveDay: WeatherFiveDayModel) {
        let weather = weatherFiveDay.list
        // массаив из 40 значений
        let  tempMaxArray = Array(weather).compactMap { (weather) -> Double? in
            return weather.main?.tempMax
        }
        let  tempMinArray = Array(weather).compactMap { (weather) -> Double? in
            return weather.main?.tempMin
        }
        let dateFiveDay = Array(weather).compactMap { (weather) -> Date? in
            return weather.dateWeather
        }
        var imageInFiveDayArray = Array(weather).compactMap { (weather) -> String? in
            return weather.weather.first?.icon
        }
        var n = 0
        for i in stride(from: 7, to: weather.count , by: 8) {
            // делю по дням  40 значений
            let arrayTempMinOneDay = tempMinArray[n...n + 7]
            let arrayTempMaxOneDay = tempMaxArray[n...n + 7]
            // нахожу минимальную и мваксимальную t  за каждый  день
            guard let tempMinOneDay = arrayTempMinOneDay.min(),
                  let tempMaxOneDay = arrayTempMaxOneDay.max() else {return}
            // иконка и дата на каждый день
            let icon = imageInFiveDayArray.remove(at: i-4)
             let date = dateFiveDay[i]
            
            days.append(Day(tempMin: tempMinOneDay, tempMax: tempMaxOneDay, date: date , image: icon))
            n = n + 8
        }
    }
    
  private func conversionDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE. dd. MM."
        dateFormatter.locale = Locale(identifier: "ru_RU")
        return dateFormatter.string(from: date)
    }

}

extension WeatherViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return days.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "FiveDayTableViewCell", for: indexPath) as! FiveDayTableViewCell
        
        cell.dateWeather.text = conversionDate(date: days[indexPath.row].date)
        cell.weatherFiveDayImage.image = UIImage(named: days[indexPath.row].image)
        cell.tempLabel.text = days[indexPath.row].tempMinandMaxString
        return cell
    }
    
}



