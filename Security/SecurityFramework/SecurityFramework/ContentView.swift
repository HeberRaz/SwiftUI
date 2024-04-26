//
//  ContentView.swift
//  SecurityFramework
//
//  Created by Heber Alvarez on 29/03/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var locationManager = LocationManager()
    let encryptor = Encryptor()
    let decryptor = Decryptor()
    @State private var distanceReading = "UNKNOWN"
    @State private var counter = 0
    @State private var shouldPresentKeychainView = false
    var body: some View {
        ZStack {
            locationManager.model?.backgroundColor.edgesIgnoringSafeArea(.all)
            VStack(spacing: 24) {
                Image(systemName: "mappin.and.ellipse")
                    .imageScale(.large)
                    .foregroundStyle(.primary)
                Text(locationManager.model?.distanceReading ?? "")
                changeProtectionLevelButton
                checkProtectionLevelButton
                decryptButton
                applyChangesButton
                goToKeychainViewButton
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea(.all)
            .background(locationManager.model?.backgroundColor)
        }
        .onAppear(perform: {
            encryptor.setProtection()
        })
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.protectedDataWillBecomeUnavailableNotification)) { notification in
            // Handle protected data becoming unavailable
            print("Notification: ", notification)
            print("Protected data will become unavailable")
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.protectedDataDidBecomeAvailableNotification)) { _ in
            print("--> Became available")
        }
        .fullScreenCover(isPresented: $shouldPresentKeychainView) {
            KeychainView()
        }
    }
}

// MARK: - ViewBuilders -
extension ContentView {
    @ViewBuilder
    private var changeProtectionLevelButton: some View {
        Button("Change Protection") {
            encryptor.changeProtectionLevel()
        }
    }

    @ViewBuilder
    private var checkProtectionLevelButton: some View {
        Button("Check Protection") {
            encryptor.checkProtectionLevel()
        }
    }

    @ViewBuilder
    private var applyChangesButton: some View {
        Button("Apply changes") {
            counter += 1
            encryptor.modifyFile(with: "Heber \(counter)")
        }
    }

    @ViewBuilder
    private var decryptButton: some View {
        Button("Decrypt File") {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                print("Person: \(decryptor.loadPerson()!)")
            }
        }
    }

    @ViewBuilder
    private var goToKeychainViewButton: some View {
        Button("Go to Keychain view") {
            shouldPresentKeychainView = true
        }
    }
}

#Preview {
    ContentView()
}
