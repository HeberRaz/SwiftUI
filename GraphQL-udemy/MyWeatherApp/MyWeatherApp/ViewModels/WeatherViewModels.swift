//
//  WeatherViewModels.swift
//  MyWeatherApp
//
//  Created by Heber Alvarez on 12/06/23.
//

import Foundation

enum LoadingStatus {
    case none
    case success
    case failure
    case notFound
}

class WeatherViewModel: ObservableObject {
    var city: String = ""
    var weatherInfo: WeatherInfoViewModel?
    let weatherIcons = ["03d": "cloud", "04d": "smoke"]
    @Published var status: LoadingStatus = .none

    private let dataManager: WeatherDataManager

    init(dataManager: WeatherDataManager) {
        self.dataManager = dataManager
    }

    func getWeatherBy(latitude: Double, longitude: Double) {
        dataManager.retreiveWeatherBy(latitude: 21, longitude: -99, closure: handleWeatherByCoordinates)
    }

    private func getSystemIcon(_ icon: String?) -> String? {
        if let icon = icon {
            return weatherIcons[icon] ?? weatherIcons["03d"]
        }
        return "exclamation mark!"
    }

    private func handleWeatherByCoordinates(result: (NetworkStatus)) {
        switch result {
        case .success(let graphqlResult):
            guard let data = graphqlResult.data,
                  let weather = data.weather,
                  let current = weather.currently,
                  let temperature = current.temperature,
                  let apparentTemperature = current.apparentTemperature,
                  let icon = getSystemIcon(current.icon),
                  let windSpeed = current.windSpeed,
                  let timezone = weather.timezone else {
                status = .notFound
                return
            }

            self.weatherInfo = WeatherInfoViewModel(
                temperature: temperature,
                apparentTemperature: apparentTemperature,
                icon: icon,
                windSpeed: windSpeed,
                timezone: timezone
            )
        case .failure(let error):
            print(error)
        }
    }
}

struct WeatherInfoViewModel {
    let temperature: Double
    let apparentTemperature: Double
    let icon: String
    let windSpeed: Double
    let timezone: String
}
