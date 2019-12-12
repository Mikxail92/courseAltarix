//
//  ViewController.swift
//  WeatherForecast
//
//  Created by 123 on 10.12.19.
//  Copyright © 2019 Zateev. All rights reserved.
//

import UIKit

class CitySelectionViewController: UIViewController {
    
    var weatherFiveDay: WeatherFiveDay!
    var weatherOneDay: WeatherForecast!
    
    private   let urlKey = "&APPID=51b90348b887a3ff4799547a1d511b3f"
    private  let urlDomein = "https://api.openweathermap.org/data/2.5/"
    var urlCountri = ""
    
    // 1 день
    private let urlOneDay = "weather?q="
    // 5 дней
    private  let urlFiveDay = "forecast?q="
    
    
    
    @IBOutlet weak var citySelectionLable: UILabel!
    @IBOutlet weak var citySelectionTextField: UITextField!
    
    
    @IBAction func confirmCiry(_ sender: UIButton) {
        downloadWeatherOneDay()
        q()
        print(weatherFiveDay)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    func q(){
        self.urlCountri = citySelectionTextField.text!
        let urlFull = urlDomein + urlFiveDay + urlCountri + urlKey
        Networking.fetchData(url: urlFull) { (weatherFive: WeatherFiveDay?, error: Error? ) in
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
            self.urlCountri = citySelectionTextField.text!
            let urlFull = urlDomein + urlOneDay + urlCountri + urlKey
            
            Networking.fetchData(url: urlFull)  { (weather : WeatherForecast?, error: Error?) in
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

