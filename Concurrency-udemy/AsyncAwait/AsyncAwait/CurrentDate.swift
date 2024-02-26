//
//  CurrentDate.swift
//  AsyncAwait
//
//  Created by Heber Alvarez on 23/02/24.
//

import Foundation

struct CurrentDate: Decodable, Identifiable {
    let id = UUID()
    let date: String

    private enum CodingKeys: String, CodingKey {
        case date = "date"
    }
}
