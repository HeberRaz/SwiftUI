//
//  ContentView.swift
//  SecurityFramework
//
//  Created by Heber Alvarez on 29/03/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var locationManager = LocationManager()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Security!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
