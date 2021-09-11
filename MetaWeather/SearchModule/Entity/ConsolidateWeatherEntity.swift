//
//  ConsolidateWeatherEntity.swift
//  MetaWeather
//
//  Created by Laddy Diaz Lamus on 11/09/21.
//

import Foundation

struct ConsolidateWeatherResponseEntity: Decodable {
    let consolidateWeather : [LocationDayWatherEntity]
    
    private enum CodingKeys: String, CodingKey {
        case consolidateWeather = "consolidate_weather"
    }
}
