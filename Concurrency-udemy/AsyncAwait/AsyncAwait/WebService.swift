//
//  WebService.swift
//  AsyncAwait
//
//  Created by Heber Alvarez on 23/02/24.
//

import Foundation

class WebService {
    func getDate() async throws -> CurrentDate? {
        guard let url = URL(string: "https://ember-sparkly-rule.glitch.me/current-date") else {
            fatalError("Wrong URL!")
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        return try? JSONDecoder().decode(CurrentDate.self, from: data)
    }
}
