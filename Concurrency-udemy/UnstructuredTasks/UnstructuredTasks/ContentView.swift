//
//  ContentView.swift
//  UnstructuredTasks
//
//  Created by Heber Alvarez on 01/03/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button {
                Task {
                    await getData()
                }
            } label: {
                Text("Get Data")
            }
            .buttonStyle(.bordered)
            .controlSize(.large)
            .tint(.teal)
            .badgeProminence(.increased)
        }
        .padding()
    }

    private func getData() async {
        // Get data
    }
}

#Preview {
    ContentView()
}
