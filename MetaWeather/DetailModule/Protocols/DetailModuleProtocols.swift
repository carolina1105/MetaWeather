//
//  DetailModuleProtocols.swift
//  MetaWeather
//
//  Created by Laddy Diaz Lamus on 11/09/21.
//

import Foundation
import UIKit

// MARK: - View Protocol
protocol DetailLocationViewProtocol {
    var presenter: DetailLocationPresenterInputProtocol? { get set }
    var location: LocationEntity? { get set }
}

// MARK: - Presenter Protocols
protocol DetailLocationPresenterInputProtocol {
    var view: DetailLocationPresenterOutputProtocol? { get set }
    var interactor: DetailLocationInteractorInputProtocol? { get set }
    var router: DetailLocationRouterProtocol? { get set }
    
    func getDetail(with woeid: Int)
}

protocol DetailLocationPresenterOutputProtocol: AnyObject {
    func didGetDetail(detail: ConsolidateWeatherResponseEntity)
    func showError()
}

// MARK: - Interactor Protocols
protocol DetailLocationInteractorInputProtocol {
    var presenter: DetailLocationInteractorOutputProtocol? { get set }
    var service: DetailLocationServiceInputProtocol? { get set }
    
    func execute(woeid: Int)
}

protocol DetailLocationInteractorOutputProtocol: AnyObject {
    func didGetDetail(detail: ConsolidateWeatherResponseEntity)
    func didAnErrorOcurred()
}

// MARK: - Service Protocols
protocol DetailLocationServiceInputProtocol {
    var interactor: DetailLocationServiceOutputProtocol? { get set }
    
    func getDetail(woeid: Int)
}

protocol DetailLocationServiceOutputProtocol: AnyObject {
    func didRetrieveDetail(_ detail: ConsolidateWeatherResponseEntity)
    func didAnErrorOcurred()
}

protocol DetailLocationRouterProtocol {
    static func createModule() -> DetailLocationViewController
}
