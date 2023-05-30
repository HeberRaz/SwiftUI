//
//  ContentView.swift
//  CountryApp
//
//  Created by Heber Alvarez on 23/05/23.
//

import SwiftUI
import CountryAppSchema

struct ContentView: View {
    @StateObject private var viewModel: CountryListViewModel = CountryListViewModel(network: CountryNetworkManager())

    @ViewBuilder
    private var countriesList: some View {
        List(viewModel.countries, id: \.code) { country in
            NavigationLink(
                destination: Text("Destination")
            ) {
                HStack {
                    Text(country.flag)
                    Text(country.name)
                }
            }
        }
        .listStyle(.plain)
        .onAppear {
            viewModel.getAllCountries()
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                countriesList
            }
            .navigationTitle("Countries")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
