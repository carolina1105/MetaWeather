//
//  DetailLocationTableViewCell.swift
//  MetaWeather
//
//  Created by Laddy Diaz Lamus on 12/09/21.
//

import UIKit

class DetailLocationTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var minTemp: UILabel!
    @IBOutlet weak var maxTemp: UILabel!
    @IBOutlet weak var weather: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCustom(_ location: LocationDayWatherEntity) {
        title.text = location.weatherStateName
        minTemp.text = "\(location.minTemp)"
        maxTemp.text = "\(location.maxTemp)"
        weather.image = UIImage(named: location.weatherStateAbbr)
        

    }
}
