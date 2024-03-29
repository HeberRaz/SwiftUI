//
//  ContentView.swift
//  SecurityFramework
//
//  Created by Heber Alvarez on 29/03/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var locationManager = LocationManager()
    @State private var distanceReading = "UNKNOWN"
    var body: some View {
        ZStack {
            locationManager.model?.backgroundColor.edgesIgnoringSafeArea(.all)
            VStack {
                Image(systemName: "mappin.and.ellipse")
                    .imageScale(.large)
                    .foregroundStyle(.primary)
                Text(locationManager.model?.distanceReading ?? "")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea(.all)
            .background(locationManager.model?.backgroundColor)
        }
    }
}

#Preview {
    ContentView()
}
