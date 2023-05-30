//
//  CountryViewModel.swift
//  CountryApp
//
//  Created by Heber Alvarez on 27/05/23.
//

import CountryAppSchema

struct CountryViewModel {
    let country: AllCountriesQuery.Data.Country

    var code: ID {
        country.code
    }

    var name: String {
        country.name
    }

    var flag: String {
        country.emoji
    }
}
