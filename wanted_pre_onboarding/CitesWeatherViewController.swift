//
//  CitesWeatherViewController.swift
//  wanted_pre_onboarding
//
//  Created by 박호현 on 2022/09/13.
//

import UIKit

class CitesWeatherViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var citiesList : [CityInformation] = [CityInformation.init(name: "서울", temp: "100", humidity: "70", icon: nil, windSpeed: "20m/s"), CityInformation.init(name: "부산", temp: "200", humidity: "80", icon: nil, windSpeed: "30m/s"), CityInformation.init(name: "울산", temp: "300", humidity: "50", icon: nil, windSpeed: "40m/s")]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citiesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cityCell = tableView.dequeueReusableCell(withIdentifier: "CitesInformationTableViewCell", for: indexPath) as? CitesInformationTableViewCell else { return UITableViewCell()}
        
       var list = citiesList[indexPath.row]
        
        cityCell.citesName.text = list.name
        cityCell.temperature.text = list.temp
        cityCell.humidity.text = list.humidity
//        cityCell?.weatherIcon = nil
        cityCell.windSpeed.text = list.windSpeed
        return cityCell
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
