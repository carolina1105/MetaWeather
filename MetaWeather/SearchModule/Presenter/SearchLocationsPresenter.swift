//
//  SearchLocationsPresenter.swift
//  MetaWeather
//
//  Created by Laddy Diaz Lamus on 11/09/21.
//

import Foundation

final class SearchLocationsPresenter: SearchLocationPresenterInputProtocol {
    
    var view: SearchLocationPresenterOutputProtocol?
    var interactor: SearchLocationInteractorInputProtocol?
    var router: SearchLocationRouterProtocol?
    
    func getLocations(with text: String) {
       // TODO
    }
}

extension SearchLocationsPresenter: SearchLocationInteractorOutputProtocol {
    func didGetLocations(locations: [LocationEntity]) {
        //TODO
    }
}
