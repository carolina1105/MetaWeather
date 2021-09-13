//
//  DetailLocationPresenter.swift
//  MetaWeather
//
//  Created by Laddy Diaz Lamus on 11/09/21.
//

import Foundation

final class DetailLocationPresenter: DetailLocationPresenterInputProtocol {
    
    var view: DetailLocationPresenterOutputProtocol?
    var interactor: DetailLocationInteractorInputProtocol?
    var router: DetailLocationRouterProtocol?
    
    func getDetail(with woeid: Int) {
        interactor?.execute(woeid: woeid)
    }
}

extension DetailLocationPresenter: DetailLocationInteractorOutputProtocol {
    func didGetDetail(detail: ConsolidateWeatherResponseEntity) {
        view?.didGetDetail(detail: detail)
    }
    
    func didAnErrorOcurred() {
        view?.showError()
    }
}
