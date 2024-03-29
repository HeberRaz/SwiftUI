//
//  LocationManager.swift
//  SecurityFramework
//
//  Created by Heber Alvarez on 29/03/24.
//

import CoreLocation

final class LocationManager: NSObject, ObservableObject {
    let manager = CLLocationManager()
    var model: BeaconProximityModel?
    @Published var degrees: Double = .zero

    override init() {
        super.init()
        manager.delegate = self
        manager.startUpdatingHeading()
        manager.requestWhenInUseAuthorization()
        manager.requestAlwaysAuthorization()
    }

    func startScanning() {
        let uuid = UUID(uuidString: "735297E7-A74B-4D39-89EF-D2916A73D8AD")!
        let beaconRegion = CLBeaconRegion(uuid: uuid, identifier: "")
        manager.startMonitoring(for: beaconRegion)
        manager.startRangingBeacons(satisfying: beaconRegion.beaconIdentityConstraint)
    }

    func update(distance: CLProximity) {
        switch distance {
        case .unknown:
            model = BeaconProximityModel(distanceReading: "UNKWNOWN")
        case .far:
            model = BeaconProximityModel(distanceReading: "FAR")
        case .near:
            model = BeaconProximityModel(distanceReading: "NEAR")
        case .immediate:
            model = BeaconProximityModel(distanceReading: "IMMEDIATE")
        default:
            break
        }
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if manager.authorizationStatus == .authorizedAlways {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                if CLLocationManager.isRangingAvailable() {
                    startScanning()
                }
            }
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        degrees = newHeading.trueHeading
    }

    func locationManager(_ manager: CLLocationManager, didStartMonitoringFor region: CLRegion) {
        print("didStartMonitoring for")
    }

    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        if let beacon = beacons.first {
            print("--> proximity")
            update(distance: beacon.proximity)
        } else {
            update(distance: .unknown)
        }
    }
}
