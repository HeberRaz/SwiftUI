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
    @State private var countryInfo: CountryInfoQuery.Data.Country?

    private var countryDetail: some View {
        return VStack {
            Text(countryInfo?.name ?? "")
            Text(countryInfo?.capital ?? "")
            Text(countryInfo?.native ?? "")
            Spacer()
            List(countryInfo?.states ?? [], id: \.name) { state in
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
            fetchCountryInfo()
        }
    }

    private func fetchCountryInfo() {
        Network.shared.apollo.fetch(query: CountryInfoQuery(code: countryCode)) { result in
            switch result {
            case .success(let graphQLResult):
                DispatchQueue.main.async {
                    self.countryInfo = graphQLResult.data?.country
                }
            case .failure(let error):
                fatalError("Error \(error)")
            }
        }
    }
}

struct CountryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailView(countryCode: "AR")
    }
}
