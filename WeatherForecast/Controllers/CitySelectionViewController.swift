//
//  CitySelectionViewController.swift
//  WeatherForecast
//
//  Created by Zateev on 13.12.19.
//  Copyright © 2019 Zateev. All rights reserved.
//

import RealmSwift
import UIKit

class CitySelectionViewController: UIViewController {
    
    var weatherFiveDay: WeatherFiveDayModel?
    var weatherOneDay: WeatherForecastOneDayModel?
    
    @IBOutlet weak var buttonConfirmCity: UIButton!
    @IBOutlet weak var citySelectionLabel: UILabel!
    @IBOutlet weak var citySelectionTextField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.isHidden = true
    }
    
    @IBAction func confirmCiry(_ sender: UIButton) {
        buttonConfirmCity.isEnabled = false
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        
        if Reachability.isConnectedToNetwork() {
            if let city = citySelectionTextField.text, city != "" {
                downloadWeatherOneDay(city: city) {
                    self.downloadWeatherFiveDay(city: city, completion: {
                        self.activateButtonAndIndicator()
                        self.performSegue(withIdentifier: "segueWeather", sender: nil)
                    })
                }
            } else {
                activateButtonAndIndicator()
                alertError(message: "Введите Город")
            }
        } else {
            guard let cityStringKey = citySelectionTextField.text?.capitalized else {return}
            
            let weatherOneDay = RealmManager.manager.getObject(ofType: WeatherForecastOneDayModel.self, forPrimaryKey: cityStringKey)
            let weatherFiveDay = RealmManager.manager.getObject(ofType: WeatherFiveDayModel.self, forPrimaryKey: cityStringKey)
            
            if  let weatherOneDay = weatherOneDay,
                let weatherFiveDay = weatherFiveDay {
                
                self.weatherFiveDay = weatherFiveDay
                self.weatherOneDay = weatherOneDay
                
                activateButtonAndIndicator()
                self.performSegue(withIdentifier: "segueWeather", sender: nil)
            } else {
                activateButtonAndIndicator()
                alertError(message: "Нет соединения с интернетом")
            }
        }
    }
    
    func downloadWeatherOneDay(city: String, completion: @escaping () -> ()) {
        Networking.fetchData(url: UrlCollection.urlOneDay.rawValue + city) {[unowned self] (weather: WeatherForecastOneDayModel?, error: Error?) in
            if error != nil {
                self.activateButtonAndIndicator()
                self.alertError(message: "Ваш город не найден,введите повторно")
            } else {
                guard let weather = weather  else {return}
                self.weatherOneDay = weather
                RealmManager.manager.add(object: self.weatherOneDay!)
                completion()
            }
        }
    }
    
    func downloadWeatherFiveDay(city: String, completion: @escaping () -> ()) {
        Networking.fetchData(url: UrlCollection.urlFiveDay.rawValue + city) {[unowned self] (weatherFiveDay: WeatherFiveDayModel?, error: Error?)  in
            if error != nil {
                self.alertError(message: "Ваш город не найден,введите повторно")
            } else {
                guard let weatherFiveDay = weatherFiveDay  else {return}
                self.weatherFiveDay = weatherFiveDay
                self.weatherFiveDay!.id = weatherFiveDay.city?.name
                RealmManager.manager.add(object: self.weatherFiveDay!)
                completion()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard  let dvc = segue.destination as? WeatherViewController else {return}
        dvc.weatherOneDay = weatherOneDay
        dvc.weatherFiveDay = weatherFiveDay
    }
    
    private  func alertError(message: String) {
        let alertController = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(ok)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func activateButtonAndIndicator() {
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
        buttonConfirmCity.isEnabled = true
    }
}
