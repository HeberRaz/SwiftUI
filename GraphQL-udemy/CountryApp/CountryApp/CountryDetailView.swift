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
    let country: AllCountriesQuery.Data.Country
    @State private var countryInfo: CountryInfoQuery.Data.Country?

    var body: some View {
        VStack {

        }
    }
}

struct CountryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
