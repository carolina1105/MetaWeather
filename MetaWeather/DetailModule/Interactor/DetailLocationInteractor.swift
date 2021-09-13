//
//  DetailLocationInteractor.swift
//  MetaWeather
//
//  Created by Laddy Diaz Lamus on 11/09/21.
//

import Foundation

final class DetailLocationInteractor: DetailLocationInteractorInputProtocol {
    
    var presenter: DetailLocationInteractorOutputProtocol?
    var service: DetailLocationServiceInputProtocol?
    
    func execute(woeid: Int) {
        service?.getDetail(woeid: woeid)
    }
}

extension DetailLocationInteractor: DetailLocationServiceOutputProtocol {
    func didRetrieveDetail(_ detail: ConsolidateWeatherResponseEntity) {
        presenter?.didGetDetail(detail: detail)
        print("DETAILS! \(detail)")
    }
    
    func didAnErrorOcurred() {
        presenter?.didAnErrorOcurred()
    }
    
    
}
