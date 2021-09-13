//
//  SearchLocationsPresenter.swift
//  MetaWeather
//
//  Created by Laddy Diaz Lamus on 11/09/21.
//

import UIKit

final class SearchLocationsPresenter: SearchLocationPresenterInputProtocol {
    
    var view: SearchLocationPresenterOutputProtocol?
    var interactor: SearchLocationInteractorInputProtocol?
    var router: SearchLocationRouterProtocol?
    
    func getLocations(with text: String) {
        interactor?.execute(location: text)
    }
    
    func showDetailView(location: LocationEntity, in view: UIViewController) {
        router?.presentDetailView(of: location, with: view)
    }
}

extension SearchLocationsPresenter: SearchLocationInteractorOutputProtocol {
    func didGetLocations(locations: [LocationEntity]) {
        view?.didGetLocations(locations: locations)
    }
}
