//
//  DetailLocationViewController.swift
//  MetaWeather
//
//  Created by Laddy Diaz Lamus on 11/09/21.
//

import UIKit

final class DetailLocationViewController: UIViewController, DetailLocationViewProtocol {
    
    var presenter: DetailLocationPresenterInputProtocol?
    var location: LocationEntity?
    
    private var detailLocation: ConsolidateWeatherResponseEntity?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getDetail(with: location?.woeid ?? 0)
    }

}

extension DetailLocationViewController: DetailLocationPresenterOutputProtocol {
    func showError() {
        //add logic to show an alert with a message
    }
    
    func didGetDetail(detail: ConsolidateWeatherResponseEntity) {
        detailLocation = detail
        let name = detailLocation?.consolidateWeather[0].weatherStateAbbr ?? ""
        let image = UIImage(named: name)
//        if image == .hc {
        DispatchQueue.main.async {
            let imageView = UIImageView(image: image)
            self.view = imageView
        }
//        }
        //reload data if needed
    }
}
