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
    var destinationCoordinate: CLLocationCoordinate2D?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        mapView.showsUserLocation = true
        
        lblLocationData.numberOfLines = 0
        lblLocationData.textAlignment = .center
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        
        guard let storyboard = self.storyboard,
              let searchVC = storyboard.instantiateViewController(identifier: "searchPlace") as? SearchPlacesViewController  else {
            return
        }
        
        self.searchVC = searchVC
        self.searchVC?.delegate = self
        
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
    
    @IBAction func navigate(_ sender: Any) {
    
        guard let sourceCoordinate = locationManager.location?.coordinate,
              let destinationCoordinate = self.destinationCoordinate else {
            return
        }
        
        let sourcePlaceMark = MKPlacemark(coordinate: sourceCoordinate)
        let destinationPlaceMark = MKPlacemark(coordinate: destinationCoordinate)
        
        let sourceItem = MKMapItem(placemark: sourcePlaceMark)
        let destinationItem = MKMapItem(placemark: destinationPlaceMark)
        
        let routeRequest = MKDirections.Request()
        routeRequest.source = sourceItem
        routeRequest.destination = destinationItem
        routeRequest.transportType = .automobile
        
        let directions = MKDirections(request: routeRequest)
        
        directions.calculate { (response, error) in
            
            guard let result = response,
                  let route = result.routes.first else {
                return
            }
            
            self.mapView.addOverlay(route.polyline)
            self.mapView.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
            
        }
    
    }
    
}

extension ViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
         
        let render = MKPolylineRenderer(overlay: overlay)
        render.strokeColor = UIColor.systemBlue
        return render
        
    }
    
}

extension ViewController: SearchPlacesViewControllerDelegate {
    
    func setPlaceInMap(place: MKPlacemark) {
        
        mapView.removeAnnotations(mapView.annotations)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = place.coordinate
        annotation.title = place.title
        
        if let city = place.locality,
           let state = place.administrativeArea {
            
            annotation.subtitle = "\(city) \(state)"
            
        }
        
        lblLocationData.text = place.title
    
        mapView.addAnnotation(annotation)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: place.coordinate, span: span)
        mapView.setRegion(region, animated: true)
        
        destinationCoordinate = place.coordinate
        
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
            searchVC?.mapRegion = mapView.region
            
            //self.geocode(location: currentLocation)
            
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


