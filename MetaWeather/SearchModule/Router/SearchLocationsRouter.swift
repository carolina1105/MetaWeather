//
//  SearchLocationsRouter.swift
//  MetaWeather
//
//  Created by Laddy Diaz Lamus on 11/09/21.
//

import UIKit

final class SearchLocationsRouter: SearchLocationRouterProtocol {
    
    static func createModule() -> SearchLocationsViewController {
        typealias ViewProtocols = SearchLocationViewProtocol & SearchLocationPresenterOutputProtocol
        typealias PresenterProtocols = SearchLocationPresenterInputProtocol & SearchLocationInteractorOutputProtocol
        typealias InteractorProtocols = SearchLocationInteractorInputProtocol & SearchLocationServiceOutputProtocol
        
        var view: ViewProtocols = SearchLocationsViewController()
        var presenter: PresenterProtocols = SearchLocationsPresenter()
        var interactor: InteractorProtocols = SearchLocationInteractor()
        var service: SearchLocationServiceInputProtocol = SearchLocationService()
        let router: SearchLocationRouterProtocol = SearchLocationsRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        interactor.service = service
        service.interactor = interactor
        
        return view as! SearchLocationsViewController
    }
    
    func presentDetailView(of location: LocationEntity) {
        //todo
    }
}
