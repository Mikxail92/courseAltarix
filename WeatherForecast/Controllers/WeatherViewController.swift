

import UIKit

class WeatherViewController: UIViewController {
    
    var weatherOneDay: WeatherForecastModel!
    var weatherFiveDay: WeatherFiveDayModel!
    
    @IBOutlet weak var viewOneDay: UIView!
    @IBOutlet weak var viewFiveDay: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var segment: UISegmentedControl!
    
    @IBOutlet weak var weatherIconImage: UIImageView!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var speedWindLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    
    
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
    
    private func appropriationLable() {
        title = weatherOneDay.name + " " +  weatherOneDay.sys.country
        pressureLabel.text = weatherOneDay.main.pressureString
        tempLabel.text = weatherOneDay.main.tempString
        humidityLabel.text = weatherOneDay.main.humidityString
        speedWindLabel.text = weatherOneDay.wind.speedString
        let image = weatherOneDay.weather[0].icon
        weatherIconImage.image = UIImage(named:image)
    }
}

extension WeatherViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weatherFiveDay.list.count / 8 
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellCollection", for: indexPath) as! CollectionViewCell
        cell.configuration(weatherFiveDay: weatherFiveDay, indexPath: indexPath)
        return cell
    }
    
}







