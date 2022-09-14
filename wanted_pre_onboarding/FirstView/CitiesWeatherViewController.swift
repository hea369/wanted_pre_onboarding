//
//  CitesWeatherViewController.swift
//  wanted_pre_onboarding
//
//  Created by 박호현 on 2022/09/13.
//

import UIKit

class CitiesWeatherViewController: UIViewController, UITableViewDelegate {
    
    var citiesList : [CityInformation] = []
    var citynames =  ["gongju","Gwangju", "gumi", "gunsan", "daegu", "daejeon", "mokpo", "busan", "seosan", "seoul", "sokcho", "suwon", "suncheon", "ulsan", "iksan", "jeonju", "jejusi", "cheonan", "cheongju", "chuncheon"]
    
    var response : [Weatherlist] = []

    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for cityName in citynames {
            WeatherAPI().callAPI(cityName: cityName) { data in
                self.citiesList.append(CityInformation(name: data.name, temp: data.main.temp.temperatureSting, humidity: "\(data.main.humidity ?? 0)", icon: data.weather.first?.icon, windSpeed: "\(data.wind.speed)m/s"))
                self.response.append(data)
                self.tableView.reloadData()
            }
        }
        
        // Do any additional setup after loading the view.
    }
    
}
extension CitiesWeatherViewController : UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citiesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cityCell = tableView.dequeueReusableCell(withIdentifier: "CitiesInformationTableViewCell", for: indexPath) as? CitiesInformationTableViewCell else { return UITableViewCell()}
        
        var list = citiesList[indexPath.row]
        cityCell.settingModel(cityModel: list)
        
        return cityCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var order = response[indexPath.row]
        guard let citiesContentsViewController = storyboard?.instantiateViewController(withIdentifier: "CitiesContentsViewController") as? CitiesContentsViewController else { return }
        citiesContentsViewController.cityDetail = CityDetailInformation(name: order.name, temp: "\(order.main.temp.temperatureSting)", feelTemp: "\(order.main.feelsLike)", humidity: "\(order.main.humidity ?? 0) ", tempMin: "\(order.main.tempMin.temperatureSting)", tempMax: "\(order.main.tempMax.temperatureSting)", atmo: "\(order.main.pressure ?? 0)", WeatherDescrip: order.weather.first?.weatherDescription, icon: order.weather.first?.icon, windSpeed: "\(order.wind.speed)m/s")
        present(citiesContentsViewController, animated: true)
    }
}

fileprivate let temperatureFormatter: MeasurementFormatter = {
    let f = MeasurementFormatter()
    f.locale = Locale(identifier: "ko_kr")
    f.numberFormatter.maximumFractionDigits = 1
    f.unitOptions = .temperatureWithoutUnit
    return f
}()

extension Double {
    var temperatureSting: String {
        var temp = Measurement<UnitTemperature>(value: self, unit: .kelvin)
        return temperatureFormatter.string(from: temp.converted(to: .celsius))
    }
}
