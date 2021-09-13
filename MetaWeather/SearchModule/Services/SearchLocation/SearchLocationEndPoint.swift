//
//  SearchLocationEndPoint.swift
//  MetaWeather
//
//  Created by Laddy Diaz Lamus on 11/09/21.
//

import Foundation

enum SearchLocationEndPoint: String {
    case getLocations = "api/location/search/?query="
    
    var path: String {
        return "\(NetworkConstants.baseURL)\(rawValue)"
    }
}
