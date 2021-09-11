//
//  SearchLocationsViewController.swift
//  MetaWeather
//
//  Created by Laddy Diaz Lamus on 11/09/21.
//

import UIKit

final class SearchLocationsViewController: UIViewController, SearchLocationViewProtocol {

    var presenter: SearchLocationPresenterInputProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension SearchLocationsViewController: SearchLocationPresenterOutputProtocol {
    func didGetLocations(locations: [LocationEntity]) {
        //todo
    }
}
