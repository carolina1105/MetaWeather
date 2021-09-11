//
//  LocationEntity.swift
//  MetaWeather
//
//  Created by Laddy Diaz Lamus on 11/09/21.
//

import Foundation

struct LocationEntity: Decodable {
    let title: String
    let locationType: String
    let woeid: Int
    
    private enum CodingKeys: String, CodingKey {
        case title
        case locationType = "location_type"
        case woeid
    }
}
