//
//  DataStub.swift
//  SecurityFramework
//
//  Created by Heber Alvarez on 29/03/24.
//

import Foundation

final class DataStub {
    static var dictionary: [String: String] = ["name": "John", "age": "27", "email": "john.mail@apple.com"]

    static var jsonData: Data? {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: dictionary, options: [])
            return jsonData
        } catch {
            print("DataStub Error \(error)")
        }
        return nil
    }
}
