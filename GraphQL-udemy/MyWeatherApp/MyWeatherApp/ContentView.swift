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
    
    var body: some View {
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
//                InvalidCityView(city: "Some city")
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherView: View {
    let viewModel: WeatherInfoViewModel

    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Image(systemName: viewModel.icon)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding(.bottom, 20)

                    Text("Title")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)

                    Text(viewModel.timezone.description)
                        .font(.body)
                        .foregroundColor(.white)

                    Spacer()

                    VStack {
                        Text(viewModel.temperature.description)
                            .font(.system(size: 60))
                            .foregroundColor(.white)

                        Text("Feels like: \(viewModel.apparentTemperature.description)")
                            .font(.caption)
                            .foregroundColor(.white)
                    }

                }
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: 250)
        .background(Color.green)
        .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
    }
}
