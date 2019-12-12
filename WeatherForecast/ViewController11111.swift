//
//  ViewController11111.swift
//  WeatherForecast
//
//  Created by 123 on 11.12.19.
//  Copyright © 2019 Zateev. All rights reserved.
//

import UIKit

class ViewController11111: UIViewController {

    @IBAction func ghfh(_ sender: UIButton) {
        print("123")
    }
    @IBOutlet weak var segm: UISegmentedControl!
    @IBOutlet weak var view1: UIView!
        @IBOutlet weak var view2: UIView!
    

    @IBAction func ssegment(_ sender: UISegmentedControl) {
        switch segm.selectedSegmentIndex {
        case 0:
         self.view1.isHidden = true
            self.view2.isHidden = false
        case 1:
            self.view2.isHidden = true
            self.view1.isHidden = false
        default:
            break
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

     
    }


}
