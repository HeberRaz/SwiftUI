//
//  BeaconProximityModel.swift
//  SecurityFramework
//
//  Created by Heber Alvarez on 29/03/24.
//

import SwiftUI

class BeaconProximityModel {
    @Published var backgroundColor: Color = .clear
    @Published var distanceReading: String

    init(distanceReading: String = "UNKNOWN") {
        self.distanceReading = distanceReading
        setBackgroundColor()
    }

    func setBackgroundColor() {
        switch distanceReading {
        case "UNKNOWN":
            backgroundColor = .gray
        case "FAR":
            backgroundColor = .blue
        case "NEAR":
            backgroundColor = .orange
        case "IMMEDIATE":
            backgroundColor = .red
        default:
            backgroundColor = .clear
        }
    }
}
