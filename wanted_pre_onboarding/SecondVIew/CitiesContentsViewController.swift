//
//  CitiesContentsViewController.swift
//  wanted_pre_onboarding
//
//  Created by 박호현 on 2022/09/13.
//

import UIKit

class CitiesContentsViewController: UIViewController {
    
    var cityDetail : CityDetailInformation?
    
    
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var feelsTemp: UILabel!
    @IBOutlet weak var hum: UILabel!
    @IBOutlet weak var tempMin: UILabel!
    @IBOutlet weak var tempMax: UILabel!
    @IBOutlet weak var atmosphericPressure: UILabel!
    @IBOutlet weak var wimdSpeed: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var weatherDescription: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let cityDetail = cityDetail {
            cityName.text = cityDetail.name
            temp.text = cityDetail.temp
            feelsTemp.text = cityDetail.feelTemp
            hum.text = cityDetail.humidity
            tempMin.text = cityDetail.tempMin
            tempMax.text = cityDetail.tempMax
            atmosphericPressure.text = cityDetail.atmo
            wimdSpeed.text = cityDetail.windSpeed
            weatherDescription.text = cityDetail.WeatherDescrip
            
            guard let icon = cityDetail.icon, let url = URL(string: "https://openweathermap.org/img/wn/\(icon)@2x.png") else { return }
            weatherIcon.load(url: url)
        }
        
    }
    
}
