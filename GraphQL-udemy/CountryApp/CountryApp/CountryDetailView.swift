//
//  CountryDetailView.swift
//  CountryApp
//
//  Created by Heber Alvarez on 27/05/23.
//

import CountryAppSchema
import SwiftUI

struct CountryDetailView: View {
    // MARK: Proeprties
    let countryCode: String
    @StateObject private var countryDetailViewModel: CountryDetailViewModel = CountryDetailViewModel(network: CountryNetworkManager())

    private var countryDetail: some View {
        return VStack {
            Text(countryDetailViewModel.name)
            Text(countryDetailViewModel.capital)
            Text(countryDetailViewModel.native)
            Spacer()
            List(countryDetailViewModel.states, id: \.id) { state in
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                    Text(state.name)
                }

            }
            .listStyle(.plain)
        }
    }

    var body: some View {
        countryDetail
        .onAppear {
            countryDetailViewModel.getCountryDetailsBy(code: countryCode)
        }
    }
}

struct CountryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailView(countryCode: "AR")
    }
}
