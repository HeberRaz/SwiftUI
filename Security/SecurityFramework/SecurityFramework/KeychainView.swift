//
//  KeychainView.swift
//  SecurityFramework
//
//  Created by Heber Alvarez on 15/04/24.
//

import SwiftUI
struct AnothreView: View {
    var body: some View {
        HStack {
            Text("Another view in here")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
struct KeychainView: View {
    @State private var showNextView = false

    var body: some View {
        Text("Keychain View")
        Button("Testing button") {
            showNextView = true
        }
        .sheet(isPresented: $showNextView) {
            AnothreView()
        }
    }
}
