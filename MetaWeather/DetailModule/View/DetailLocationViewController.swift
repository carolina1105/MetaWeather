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
    
    private var consolidateWeather: ConsolidateWeatherResponseEntity?
    private var detailLocation: [LocationDayWatherEntity] = []

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getDetail(with: location?.woeid ?? 0)
        setupTableView()
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}

extension DetailLocationViewController: DetailLocationPresenterOutputProtocol {
    func showError() {
        //add logic to show an alert with a message
    }
    
    func didGetDetail(detail: ConsolidateWeatherResponseEntity) {
        consolidateWeather = detail
        DispatchQueue.main.async {
            self.detailLocation = self.consolidateWeather?.consolidateWeather ?? []
            self.tableView.reloadData()
        }
    }
}

extension DetailLocationViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if detailLocation.count == 0 {
            tableView.setEmptyMessage("No weather record")
        } else {
            tableView.restore()
        }
        
        return detailLocation.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "DetailLocationTableViewCell") as? DetailLocationTableViewCell
        if (cell == nil) {
            tableView.register(UINib(nibName: "DetailLocationTableViewCell", bundle: nil), forCellReuseIdentifier: "DetailLocationTableViewCell")
            cell = tableView.dequeueReusableCell(withIdentifier: "DetailLocationTableViewCell") as? DetailLocationTableViewCell
        }
        cell?.setCustom(detailLocation[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
}
