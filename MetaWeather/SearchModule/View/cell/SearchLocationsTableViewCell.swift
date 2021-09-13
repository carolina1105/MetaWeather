//
//  SearchLocationsTableViewCell.swift
//  MetaWeather
//
//  Created by Laddy Diaz Lamus on 12/09/21.
//

import UIKit

class SearchLocationsTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var typeLocation: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCustom(_ location: LocationEntity) {
        title.text = location.title
        typeLocation.text = location.locationType

    }
    
}
