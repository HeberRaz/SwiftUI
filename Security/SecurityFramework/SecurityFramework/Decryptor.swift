//
//  Decryptor.swift
//  SecurityFramework
//
//  Created by Heber Alvarez on 30/03/24.
//

import Foundation
final class Decryptor {
    private let fileManager = FileManager.default
    func loadPerson() -> Person? {
        do {
            // Get documents directory
            let documentsDirectory = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)

            // Append folder and file name to documents directory URL
            let dataPath = documentsDirectory.appendingPathComponent("MyFolder")
            let filePath = dataPath.appendingPathComponent("protectedData.txt")
            let data = try Data(contentsOf: filePath)

            let person = try JSONDecoder().decode(Person.self, from: data)
            return person
        } catch {
            print("LoadPerson Error \(error)")
        }
        return nil
    }
}
