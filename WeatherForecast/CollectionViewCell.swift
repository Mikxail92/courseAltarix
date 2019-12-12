//
//  CollectionViewCell.swift
//  WeatherForecast
//
//  Created by 123 on 11.12.19.
//  Copyright © 2019 Zateev. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var tempLable: UILabel!
    @IBOutlet weak var dateWeather: UILabel!
    @IBOutlet weak var iweatherImage: UIImageView!
    
    func configuration(weatherFiveDay: WeatherFiveDay){
      calculationMaxTemp(weatherFiveDay: weatherFiveDay)
        
              }
    
    
    func calculationMaxTemp(weatherFiveDay: WeatherFiveDay) {
    
            }
        


}
