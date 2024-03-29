//
//  LocationManager.swift
//  SecurityFramework
//
//  Created by Heber Alvarez on 29/03/24.
//

import CoreLocation

final class LocationManager: NSObject, ObservableObject {
    let manager = CLLocationManager()
    @Published var degrees: Double = .zero

    override init() {
        super.init()
        manager.delegate = self
        manager.startUpdatingHeading()
        manager.requestWhenInUseAuthorization()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        degrees = newHeading.trueHeading
    }
}
