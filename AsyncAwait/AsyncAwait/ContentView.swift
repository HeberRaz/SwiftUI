//
//  ContentView.swift
//  AsyncAwait
//
//  Created by Heber Alvarez on 13/02/24.
//

import SwiftUI

struct CurrentDate: Decodable, Identifiable {
    let id = UUID()
    let date: String

    private enum CodingKeys: String, CodingKey {
        case date = "date"
    }
}

struct ContentView: View {

    var body: some View {
        NavigationView {
            List(1...10, id: \.self) { index in
                Text("\(index)")
            }.listStyle(.plain)

            .navigationTitle("Dates")
            .navigationBarItems(trailing: Button(action: {
                // button action
            }, label: {
                Image(systemName: "arrow.clockwise.circle")
            }))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}