//
//  Place.swift
//  CoreLocationExample
//
//  Created by Israel Torres Alvarado on 08/07/21.
//

import MapKit

class Place: NSObject, MKAnnotation {
    
    let title: String?
    let subtitle: String?
    
    var coordinate: CLLocationCoordinate2D
    
    init(coordinate: CLLocationCoordinate2D, title: String?, subtitle: String?) {
        self.coordinate = coordinate
        self.title  = title
        self.subtitle = subtitle
        super.init()
    }
    
}
