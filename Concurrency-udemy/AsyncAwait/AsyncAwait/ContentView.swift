//
//  ContentView.swift
//  AsyncAwait
//
//  Created by Heber Alvarez on 13/02/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var currentDateListViewModel = CurrentDateListViewModel()
    @State private var currentDates = [CurrentDate]()

    var body: some View {
        NavigationView {
            List(currentDateListViewModel.currentDates, id: \.id) { currentDate in
                Text("\(currentDate.date)")
            }.listStyle(.plain)

            .navigationTitle("Dates")
            .navigationBarItems(trailing: Button(action: {
                Task {
                    await currentDateListViewModel.populateAllDates
                }
            }, label: {
                Image(systemName: "arrow.clockwise.circle")
            }))
            .task {
                await currentDateListViewModel.populateAllDates()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
