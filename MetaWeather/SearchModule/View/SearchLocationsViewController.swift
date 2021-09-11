//
//  SearchLocationsViewController.swift
//  MetaWeather
//
//  Created by Laddy Diaz Lamus on 11/09/21.
//

import UIKit

final class SearchLocationsViewController: UIViewController, SearchLocationViewProtocol {
    
    var presenter: SearchLocationPresenterInputProtocol?
    
    private let searchController = UISearchController()
    private var locations: [LocationEntity] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchController()
        setupTableView()
        presenter?.getLocations(with: "london")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        self.navigationItem.title = "LOCATIONS"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .always
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .systemYellow
        self.navigationController?.navigationBar.standardAppearance = appearance
        self.navigationController?.navigationBar.compactAppearance = appearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    private func setupSearchController () {
        searchController.searchBar.delegate = self
        
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}

extension SearchLocationsViewController: SearchLocationPresenterOutputProtocol {
    func didGetLocations(locations: [LocationEntity]) {
        DispatchQueue.main.async {
            self.locations = locations
            self.tableView.reloadData()
        }
    }
}

// MARK: - SearchController Delegate
extension SearchLocationsViewController: UISearchBarDelegate {
    
    // func called when a user press the search button in the keyboard.
    // execute the request to search items if there's text in the searchBar
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchText = searchBar.text {
            //            presenter.executeSearch(with: searchText)
        }
    }
}

extension SearchLocationsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = locations[indexPath.row].title
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
}
