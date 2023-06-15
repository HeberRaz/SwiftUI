//
//  WeatherDataManager.swift
//  MyWeatherApp
//
//  Created by Heber Alvarez on 12/06/23.
//

import WeatherAppSchema
import Apollo

enum NetworkStatus {
    case success(GraphQLResult<WeatherByCoordinatesQuery.Data>)
    case failure(Error)
}

final class WeatherDataManager {
    func retreiveWeatherBy(latitude: Double, longitude: Double, closure: @escaping (NetworkStatus) -> Void) {
        Network.shared.apollo.fetch(query: WeatherByCoordinatesQuery(latitude: latitude, longitude: longitude)) { result in
            switch result {
            case .success(let graphqlData):
                closure(.success(graphqlData))
            case .failure(let error):
                closure(.failure(error))
            }
        }
    }
}
