//
//  SearchLocationInteractor.swift
//  MetaWeather
//
//  Created by Laddy Diaz Lamus on 11/09/21.
//

import Foundation

final class SearchLocationInteractor: SearchLocationInteractorInputProtocol {
    
    var presenter: SearchLocationInteractorOutputProtocol?
    var service: SearchLocationServiceInputProtocol?
    
    func execute(location: String) {
        service?.getLocation(location)
    }
}

extension SearchLocationInteractor: SearchLocationServiceOutputProtocol {
    func didRetrieveLocations(_ locations: [LocationEntity]) {
        presenter?.didGetLocations(locations: locations)
        print(locations)
    }
    
    func didAnErrorOcurred() {
        print("Error en el servicio de locations")
    }
    
    
}
