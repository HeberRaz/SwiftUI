//
//  ContentView.swift
//  MyWeatherApp
//
//  Created by Heber Alvarez on 12/06/23.
//

import Apollo
import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = WeatherViewModel(dataManager: WeatherDataManager())

    @ViewBuilder
    private var textField: some View {
        VStack {
            TextField("City", text: $viewModel.latitude) { _ in

            } onCommit: {
                viewModel.getWeatherBy(
                    latitude: Double(viewModel.latitude)!,
                    longitude: -99
                )
            }.textFieldStyle(.roundedBorder)
            Spacer()

            switch viewModel.status {
            case .success:
                viewModel.weatherInfo.map {
                    WeatherView(viewModel: $0)
                }
            case .notFound:
                Text("Invalid city view")
            default:
                EmptyView()
            }

            Spacer()
        }
        .padding()
        .navigationTitle("Weather")
//        .embedInNavigationView
    }
    
    var body: some View {
        textField
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
