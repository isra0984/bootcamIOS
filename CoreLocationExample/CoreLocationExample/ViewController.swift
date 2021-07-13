//
//  ViewController.swift
//  CoreLocationExample
//
//  Created by Israel Torres Alvarado on 07/07/21.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var lblLocationData: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager: CLLocationManager!
    var resultSearchController: UISearchController? = nil
    
    var searchVC: SearchPlacesViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblLocationData.numberOfLines = 0
        lblLocationData.textAlignment = .center
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        
        guard let storyboard = self.storyboard,
              let searchVC = storyboard.instantiateViewController(identifier: "searchPlace") as? SearchPlacesViewController  else {
            return
        }
        
        self.searchVC = searchVC
        searchVC.mapRegion = mapView.region
        
        resultSearchController = UISearchController(searchResultsController: searchVC)
        resultSearchController?.searchResultsUpdater = searchVC
        
        guard let searchBar = resultSearchController?.searchBar else {
            return
        }
        
        searchBar.sizeToFit()
        searchBar.placeholder = "Busca un lugar..."
        
        self.navigationItem.searchController = resultSearchController
        
        resultSearchController?.hidesNavigationBarDuringPresentation = true
        resultSearchController?.obscuresBackgroundDuringPresentation = true
        definesPresentationContext = true

        
    }

    @IBAction func getLocation(_ sender: Any) {
        
        if CLLocationManager.locationServicesEnabled() {
            
            locationManager.requestWhenInUseAuthorization()
            
        } else {
            
        }
        
    }
    
}

extension ViewController: CLLocationManagerDelegate {
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        switch manager.authorizationStatus {
        case .authorizedAlways, .authorizedWhenInUse:
           
            locationManager.startUpdatingLocation()
            
            guard let currentLocation = locationManager.location else {
                return
            }
            
            lblLocationData.text = "\(currentLocation.coordinate)"
            mapView.centerLocation(location: currentLocation)

            let coordinateRegion = MKCoordinateRegion(center: currentLocation.coordinate,
                                                      latitudinalMeters: 500,
                                                      longitudinalMeters: 500)
            
            searchVC?.mapRegion = coordinateRegion
            
            
            self.geocode(location: currentLocation)
            
            print("LOCATION: \(currentLocation)")
            
        default:
            print("El usuario no permitio la localizacion")
        }
        
    }
    
    
    func geocode(location: CLLocation) {
        
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { places, error in
            
            guard let placeMark = places?.first, error == nil else {
                return
            }
            
            let place = Place(coordinate: location.coordinate,
                              title: placeMark.name,
                              subtitle: placeMark.subLocality)
            
            self.mapView.addAnnotation(place)
            
        }

    }
    
    
}

extension MKMapView {
    
    func centerLocation(location: CLLocation, regionRadius: CLLocationDistance = 1000) {
            
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                  latitudinalMeters: regionRadius,
                                                  longitudinalMeters: regionRadius)
            
        setRegion(coordinateRegion, animated: true)
    }
    
}


