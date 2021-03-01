//
//  LocationManager.swift
//  MapsComparison
//
//  Created by Pasca Alberto, IT on 01/03/21.
//

import UIKit
import Combine
import CoreLocation

class LocationManager: NSObject, ObservableObject {
    private let locationManager = CLLocationManager()
    
    @Published var location: CLLocation? {
        willSet { objectWillChange.send() }
    }
    
    var latitude: CLLocationDegrees {
        return location?.coordinate.latitude ?? 0
    }
    
    var longitude: CLLocationDegrees {
        return location?.coordinate.longitude ?? 0
    }
    
    override init() {
        super.init()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.location = location
    }
    
}
