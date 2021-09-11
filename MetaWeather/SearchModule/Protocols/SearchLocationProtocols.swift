//
//  SearchLocationProtocols.swift
//  MetaWeather
//
//  Created by Laddy Diaz Lamus on 11/09/21.
//

import Foundation
import UIKit

// MARK: - View Protocol
protocol SearchLocationViewProtocol {
    var presenter: SearchLocationPresenterInputProtocol? { get set }
}

// MARK: - Presenter Protocols
protocol SearchLocationPresenterInputProtocol {
    var view: SearchLocationPresenterOutputProtocol? { get set }
    var interactor: SearchLocationInteractorInputProtocol? { get set }
    var router: SearchLocationRouterProtocol? { get set }
    
    func getLocations(with text: String)
}

protocol SearchLocationPresenterOutputProtocol: AnyObject {
    func didGetLocations(locations: [LocationEntity])
}

// MARK: - Interactor Protocols
protocol SearchLocationInteractorInputProtocol {
    var presenter: SearchLocationInteractorOutputProtocol? { get set }
    var service: SearchLocationServiceInputProtocol? { get set }
    
    func execute(location: String)
}

protocol SearchLocationInteractorOutputProtocol: AnyObject {
    func didGetLocations(locations: [LocationEntity])
}

// MARK: - Service Protocols
protocol SearchLocationServiceInputProtocol {
    var interactor: SearchLocationServiceOutputProtocol? { get set }
    
    func getLocation(_ location: String)
}

protocol SearchLocationServiceOutputProtocol: AnyObject {
    func didRetrieveLocations(_ locations: [LocationEntity])
    func didAnErrorOcurred()
}

protocol SearchLocationRouterProtocol {
    static func createModule() -> SearchLocationsViewController
    func presentDetailView(of location: LocationEntity)
}
