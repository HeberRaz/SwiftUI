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

    private func handleWeatherByCoordinates(result: (NetworkStatus) {
        switch result {
        case .success(let graphqlResult):
            print(graphqlResult)
        case .failure(let error):
            print(error)
        }
    }


}

struct WeatherInfoViewModel {
    let temperature: Double
    let humidity: Double
}
