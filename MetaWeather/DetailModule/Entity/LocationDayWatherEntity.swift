//
//  LocationDayWatherEntity.swift
//  MetaWeather
//
//  Created by Laddy Diaz Lamus on 11/09/21.
//

import Foundation

struct LocationDayWatherEntity: Decodable {
    let weatherStateName: String
    let weatherStateAbbr: String
    let applicableDate: String
    let minTemp: Float
    let maxTemp: Float
    
    private enum CodingKeys: String, CodingKey {
        case weatherStateName = "weather_state_name"
        case weatherStateAbbr = "weather_state_abbr"
        case applicableDate = "applicable_date"
        case minTemp = "min_temp"
        case maxTemp = "max_temp"
    }
}

extension LocationDayWatherEntity {
    enum WeatherState: String {
        case sn
        case sl
        case h 
        case t 
        case hr
        case lr
        case s 
        case hc
        case lc
        case c 

        var name: String {
            return rawValue
        }
    }
}
