//
//  DetailWeatherService.swift
//  MetaWeather
//
//  Created by Laddy Diaz Lamus on 11/09/21.
//

import Foundation

final class DetailLocationWeatherService: BaseService, DetailLocationServiceInputProtocol {
    
    var interactor: DetailLocationServiceOutputProtocol?
    
    func getDetail(woeid: Int) {
        let endpoint = DetailLocationWeatherEndPoint.getDetail.path + "\(woeid)"
        sendRequest(endpoint, of: ConsolidateWeatherResponseEntity.self) { [weak interactor] result in
            switch result {
            case .success(let detail):
                interactor?.didRetrieveDetail(detail)
            case .failure(_):
                interactor?.didAnErrorOcurred()
            }
        }
    }
}
