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
    let minTemp: Double
    let maxTemp: Double
    
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
        case sn = "Snow"
        case sl = "Sleet"
        case h = "Hail"
        case t = "Thunderstorm"
        case hr = "Heavy Rain"
        case lr = "Light Rain"
        case s = "Showers"
        case hc = "Heavy Cloud"
        case lc = "Light Cloud"
        case c = "Clear"

        var name: String {
            return rawValue
        }
    }
}


