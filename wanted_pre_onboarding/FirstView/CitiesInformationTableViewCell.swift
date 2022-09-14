//
//  CitesInformationTableViewCell.swift
//  wanted_pre_onboarding
//
//  Created by 박호현 on 2022/09/13.
//

import UIKit

class CitiesInformationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var citiesName: UILabel!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var windSpeed: UILabel!
    
    func settingModel(cityModel:CityInformation) {
        citiesName.text = cityModel.name.returnString()
        temperature.text = cityModel.temp
        humidity.text = cityModel.humidity
        windSpeed.text = cityModel.windSpeed
        if let url = cityModel.icon {
            let iconURL = "https://openweathermap.org/img/wn/\(url)@2x.png"
            let url = URL(string: iconURL)
            weatherIcon.image = UIImage(data: IconIamgeDown.shared.down(url: url!))
//            weatherIcon.load(url: url!)
           
        }
        
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
