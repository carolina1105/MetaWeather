//
//  GetWeatherDayLocationEndPoint.swift
//  MetaWeather
//
//  Created by Laddy Diaz Lamus on 11/09/21.
//

import Foundation

enum DetailLocationWeatherEndPoint: String {
    case getDetail = "api/location/"
    
    var path: String {
        return "\(NetworkConstants.baseURL)\(rawValue)"
    }
}
