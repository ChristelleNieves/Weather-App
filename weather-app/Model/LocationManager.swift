//
//  LocationManager.swift
//  weather-app
//
//  Created by Christelle Nieves on 9/9/21.
//

import Foundation
import UIKit
import CoreLocation

public class LocationManager {
    
    let manager = CLLocationManager()
    var currentLocation: CLLocation?
    var cityName = ""
    
    
    // Returns the latitude and longitude coordinates as a tuple
    func fetchLocation() -> (Double, Double) {
        manager.requestWhenInUseAuthorization()
        
        
        if manager.authorizationStatus == .authorizedWhenInUse || manager.authorizationStatus == .authorizedAlways {
            currentLocation = manager.location
        }
        
        guard let latitude = currentLocation?.coordinate.latitude else { return (0.0, 0.0) }
        guard let longitude = currentLocation?.coordinate.longitude else { return (0.0, 0.0) }
        
        return (latitude, longitude)
    }
}
