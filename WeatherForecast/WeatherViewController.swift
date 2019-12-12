//
//  ViewControllerWeather.swift
//  WeatherForecast
//
//  Created by 123 on 10.12.19.
//  Copyright © 2019 Zateev. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    var weatherOneDay: WeatherForecast!
    
    var weatherFiveDay: WeatherFiveDay!
    
    
    @IBOutlet weak var viewOneDay: UIView!
    @IBOutlet weak var viewFiveDay: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var segment: UISegmentedControl!
    
    @IBOutlet weak var cityLable: UILabel!
    @IBOutlet weak var weatherIconImage: UIImageView!
    @IBOutlet weak var pressureLable: UILabel!
    @IBOutlet weak var humidityLable: UILabel!
    @IBOutlet weak var speedWindLable: UILabel!
    @IBOutlet weak var tempLable: UILabel!
    
    
    
    @IBAction func actionSegment(_ sender: UISegmentedControl) {
        switch segment.selectedSegmentIndex {
        case 0:
            self.viewOneDay.isHidden = false
            self.viewFiveDay.isHidden = true
        case 1:
            self.viewOneDay.isHidden = true
            self.viewFiveDay.isHidden = false
        default:
            break
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appropriationLable()
    }
    private func appropriationLable(){
        self.cityLable.text = weatherOneDay.name
        self.pressureLable.text = "Давление \(Double(weatherOneDay.main.pressure) * 0.75) мм р.с."
        self.tempLable.text = "\( Int(weatherOneDay.main.temp) - 273 ) С°"
        self.humidityLable.text = "Влажность  \(weatherOneDay.main.humidity)  %"
        self.speedWindLable.text = "Cкорость ветра \(weatherOneDay.wind.speed)  m/c"
        let image = weatherOneDay.weather[0].icon
        self.weatherIconImage.image = UIImage(named:image)
    }
}






extension WeatherViewController: UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellCollection", for: indexPath) as! CollectionViewCell
        
        // вфчисление максимальной Т мин и   на 5 дней
        
        let weather  = weatherFiveDay.list
        
        var  tempMaxArray = [Double]()
        var  supportArray1 = [Double]()
        
        var tempMinArray = [Double]()
        var supportArray2 = [Double]()
        
        var dateArray = [String]()
        var supportDateArray = [String]()
        
        // создаю массив всех значегий мин и макс дата
        
        for i in weather {
            supportArray1.append(i.main.temp_max)
            supportArray2.append(i.main.temp_min)
            supportDateArray.append(i.dt_txt)
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
        
        cell.dateWeather.text =  weekdayString  + " " + dayString + "." + monthString
    
        cell.tempLable.text = averageTempMin + " / " + averageTempMax
        
        
        
        return cell
    }
    
}
extension WeatherViewController: UICollectionViewDelegate{
    
}






