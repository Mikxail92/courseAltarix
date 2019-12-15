//
//  ViewController.swift
//  WeatherForecast
//
//  Created by 123 on 10.12.19.
//  Copyright © 2019 Zateev. All rights reserved.
//

import UIKit

class CitySelectionViewController: UIViewController {
    
    var weatherFiveDay: WeatherFiveDayModel!
    var weatherOneDay: WeatherForecastModel!
    
    var urlCity = ""
  
    
    @IBOutlet weak var citySelectionLabel: UILabel!
    @IBOutlet weak var citySelectionTextField: UITextField!
    
    
    @IBAction func confirmCiry(_ sender: UIButton) {
        downloadWeatherOneDay()
        downloadWeatherFiveDay()
          }
 
    
    
    func downloadWeatherFiveDay(){
        self.urlCity = citySelectionTextField.text!
        let urlFull = UrlCountDay.urlFiveDay.rawValue + urlCity 
        Networking.fetchData(url: urlFull) { [unowned self]  (weatherFive: WeatherFiveDayModel?, error: Error? )  in
            self.weatherFiveDay = weatherFive
            if error != nil{
                DispatchQueue.main.async{
                    self.alertTextError()
                }
            } else{
                self.weatherFiveDay = weatherFive
                DispatchQueue.main.async{
                    self.performSegue(withIdentifier: "segueWeather", sender: nil)
               }
            }
            
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard  let dvc = segue.destination as? WeatherViewController else {return}
        dvc.weatherOneDay = self.weatherOneDay
        
        dvc.weatherFiveDay = self.weatherFiveDay
        
    }
    
    func downloadWeatherOneDay(){
        if  citySelectionTextField.text != "" {
            self.urlCity = citySelectionTextField.text!
            let urlFull =  UrlCountDay.urlOneDay.rawValue + urlCity
            
            Networking.fetchData(url: urlFull)  { (weather : WeatherForecastModel?, error: Error?) in
                if error != nil {
                    DispatchQueue.main.async{
                        self.alertTextError()
                    }
                    print("нет данных")
                }else{
                    if let weather = weather{
                        self.weatherOneDay = weather
                        
                    }
                }
            }
            
        }else{
            alertTextEmpti()
            print("пустой текст")
        }
    }
    
    private  func alertTextEmpti(){
        let alertController = UIAlertController(title: "Ошибка", message: "Введите Город", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(ok)
        self.present(alertController, animated: true, completion: nil)
    }
    
    private  func alertTextError(){
        let alertController = UIAlertController(title: "Ошибка", message: "Ваш город не найден,введите повторно", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(ok)
        self.present(alertController, animated: true, completion: nil)
    }
    
}

