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
    
    //private var locations: [LocationEntity] = []
    
    func getLocations(with text: String) {
        interactor?.execute(location: text)
    }
}

extension SearchLocationsPresenter: SearchLocationInteractorOutputProtocol {
    func didGetLocations(locations: [LocationEntity]) {
        view?.didGetLocations(locations: locations)
    }
}
