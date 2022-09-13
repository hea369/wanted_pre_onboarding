//
//  CitesInformationTableViewCell.swift
//  wanted_pre_onboarding
//
//  Created by 박호현 on 2022/09/13.
//

import UIKit

class CitesInformationTableViewCell: UITableViewCell {
    @IBOutlet weak var citesName: UILabel!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var windSpeed: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
