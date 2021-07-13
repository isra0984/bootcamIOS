//
//  SearchPlacesViewController.swift
//  CoreLocationExample
//
//  Created by Israel Torres Alvarado on 12/07/21.
//

import UIKit
import MapKit

class SearchPlacesViewController: UIViewController {

    @IBOutlet weak var placesTableView: UITableView!
    
    var mapRegion: MKCoordinateRegion?
    
    var places: [MKMapItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        placesTableView.dataSource = self
        
    }

}

extension SearchPlacesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        let place = places[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        if let name = place.name, let street = place.placemark.thoroughfare {
            cell.textLabel?.text = "\(name)\n\(street)"
        }
    
        return cell
    
    }
    
}

extension SearchPlacesViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        
        guard let searchText = searchController.searchBar.text else {
            return
        }
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchText
        
        if let region = mapRegion {
            request.region = region
        }
        
        let searchInvoke = MKLocalSearch(request: request)
        
        searchInvoke.start { response , error in
            
            guard let result = response else {
                return
            }
            
            self.places = result.mapItems
            self.placesTableView.reloadData()
            
        }
        
    }
    
}
