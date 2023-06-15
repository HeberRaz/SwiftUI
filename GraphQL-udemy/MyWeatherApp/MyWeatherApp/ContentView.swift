//
//  ContentView.swift
//  MyWeatherApp
//
//  Created by Heber Alvarez on 12/06/23.
//

import Apollo
import SwiftUI

struct ContentView: View {
    let viewModel = WeatherViewModel(dataManager: WeatherDataManager())
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
//            viewModel.getWeatherBy(latitude: 21, longitude: -99)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
