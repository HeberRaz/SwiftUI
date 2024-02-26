//
//  CurrentDateListViewModel.swift
//  AsyncAwait
//
//  Created by Heber Alvarez on 23/02/24.
//

import Foundation

@MainActor
class CurrentDateListViewModel: ObservableObject {
    @Published var currentDates = [CurrentDateViewModel]()

    func populateAllDates() async {
        do {
            let currentDate = try await WebService().getDate()
            if let currentDate {
                let currentDateViewModel = CurrentDateViewModel(currentDate: currentDate)
                currentDates.append(currentDateViewModel)
            }
        } catch {
            print("--> ERROR", error)
        }
    }
}

struct CurrentDateViewModel {
    let currentDate: CurrentDate

    var id: UUID {
        currentDate.id
    }

    var date: String {
        currentDate.date
    }
}
