//
//  SecurityFrameworkApp.swift
//  SecurityFramework
//
//  Created by Heber Alvarez on 29/03/24.
//

import SwiftUI

@main
struct SecurityFrameworkApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func applicationProtectedDataWillBecomeUnavailable(_ application: UIApplication) {
        // Handle protected data becoming unavailable
        print("Protected data will become unavailable")
    }
}
