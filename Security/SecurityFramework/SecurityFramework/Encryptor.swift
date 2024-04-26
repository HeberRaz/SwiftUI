//
//  Encrypter.swift
//  SecurityFramework
//
//  Created by Heber Alvarez on 29/03/24.
//

import Foundation

final class Encryptor {
    let data = DataStub.jsonData
    let fileManager = FileManager.default

    var encodedData: Data? {
        let encoder = JSONEncoder()
        do {
            let encodedData = try encoder.encode(DataStub.dictionary)
            return encodedData
        } catch {
            print("Encoding Error: \(error)")
        }
        return nil
    }

    func modifyFile(with name: String) {
        var dictionary = DataStub.dictionary
        dictionary["name"] = name

        do {
            let data = try JSONEncoder().encode(dictionary)
            // Get documents directory
            let documentsDirectory = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)

            // Append folder and file name to documents directory URL
            let dataPath = documentsDirectory.appendingPathComponent("MyFolder")
            let filePath = dataPath.appendingPathComponent("protectedData.txt")

            // Check if the file already exists
            if fileManager.fileExists(atPath: filePath.path) {
                print("File already exists at \(filePath)")
            }

            // Write data to file
            try data.write(to: filePath, options: .completeFileProtection)

            print("Data encrypted and saved successfully at \(filePath)")
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }

    func setProtection() {
        let data = encodedData
        do {
            // Get documents directory
            let documentsDirectory = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)

            // Append folder and file name to documents directory URL
            let dataPath = documentsDirectory.appendingPathComponent("MyFolder")
            let filePath = dataPath.appendingPathComponent("protectedData.txt")

            // Check if the file already exists
            if fileManager.fileExists(atPath: filePath.path) {
                print("File already exists at \(filePath)")
            }

            // Create directory if it doesn't exist
            if !fileManager.fileExists(atPath: dataPath.path) {
                try fileManager.createDirectory(at: dataPath, withIntermediateDirectories: true, attributes: nil)
            }

            // Write data to file
            try data?.write(to: filePath, options: .completeFileProtection)

            print("Data encrypted and saved successfully at \(filePath)")
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }

    func changeProtectionLevel() {
        do {
            // Get documents directory
            let documentsDirectory = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)

            // Append folder and file name to documents directory URL
            let dataPath = documentsDirectory.appendingPathComponent("MyFolder")
            let filePath = dataPath.appendingPathComponent("protectedData.txt")

            // Check if the file already exists
            if fileManager.fileExists(atPath: filePath.path) {
                print("File already exists at \(filePath)")
            }

            // Update protection level
           try (filePath as NSURL).setResourceValue(
            URLFileProtection.complete,
            forKey: .fileProtectionKey
           )
            print("Data protection level successfully updated at \(filePath)")
        }
        catch {
           print("Change protection level error \(error)")
        }
    }

    func checkProtectionLevel() {
           do {

               // Get documents directory
               let documentsDirectory = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)

               // Append folder and file name to documents directory URL
               let dataPath = documentsDirectory.appendingPathComponent("MyFolder")
               var filePath = dataPath.appendingPathComponent("protectedData.txt")

               // Retrieve file protection level
               let resourceValues = URLResourceValues()
//               resourceValues.fileProtection = nil // Ensure to clear the existing value
               try filePath.setResourceValues(resourceValues)

               // Get the current file protection level
               if let protectionLevel = try filePath.resourceValues(forKeys: [.fileProtectionKey]).fileProtection {
                   print("File protection level: \(protectionLevel)")
               } else {
                   print("File protection level not available")
               }
           } catch {
               print("Error: \(error.localizedDescription)")
           }
       }
}
