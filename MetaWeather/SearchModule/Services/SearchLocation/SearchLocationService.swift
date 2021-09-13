//
//  SearchLocationService.swift
//  MetaWeather
//
//  Created by Laddy Diaz Lamus on 11/09/21.
//

import Foundation

final class SearchLocationService: BaseService, SearchLocationServiceInputProtocol {
    
    var interactor: SearchLocationServiceOutputProtocol?
    
    func getLocation(_ location: String) {
        let endpoint = SearchLocationEndPoint.getLocations.path + location
        sendRequest(endpoint, of: [LocationEntity].self) { [weak interactor] result in
            switch result {
            case .success(let locations):
                interactor?.didRetrieveLocations(locations)
            case .failure(_):
                interactor?.didAnErrorOcurred()
            }
        }
    }
}
