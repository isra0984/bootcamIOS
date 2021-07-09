//
//  ViewController.swift
//  CoreLocationExample
//
//  Created by Israel Torres Alvarado on 07/07/21.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var lblLocationData: UILabel!
    
    var locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        
    }

    @IBAction func getLocation(_ sender: Any) {
        
        if CLLocationManager.locationServicesEnabled() {
            
            locationManager.requestAlwaysAuthorization()
            
        } else {
            
        }
        
    }
    
}

extension ViewController: CLLocationManagerDelegate {
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        switch manager.authorizationStatus {
        case .authorizedAlways:
            print("always")
        case .authorizedWhenInUse:
            print("When use")
        default:
            print("El usuario no permitio la localizacion")
        }
        
    }
    
}


