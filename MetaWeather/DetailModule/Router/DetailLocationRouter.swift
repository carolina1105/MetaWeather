//
//  DetailLocationRouter.swift
//  MetaWeather
//
//  Created by Laddy Diaz Lamus on 11/09/21.
//

import Foundation

final class DetailLocationRouter: DetailLocationRouterProtocol {
    static func createModule() -> DetailLocationViewController {
        typealias ViewProtocols = DetailLocationViewProtocol & DetailLocationPresenterOutputProtocol
        typealias PresenterProtocols = DetailLocationPresenterInputProtocol & DetailLocationInteractorOutputProtocol
        typealias InteractorProtocols = DetailLocationInteractorInputProtocol & DetailLocationServiceOutputProtocol
        
        var view: ViewProtocols = DetailLocationViewController()
        var presenter: PresenterProtocols = DetailLocationPresenter()
        var interactor: InteractorProtocols = DetailLocationInteractor()
        var service: DetailLocationServiceInputProtocol = DetailLocationWeatherService()
        let router: DetailLocationRouterProtocol = DetailLocationRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        interactor.service = service
        service.interactor = interactor
        
        return view as! DetailLocationViewController
    }
}
