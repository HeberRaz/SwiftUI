//
//  ContentView.swift
//  WeSplit
//
//  Created by Heber Raziel Alvarez Ruedas on 16/01/23.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool

    let tipPercentages = [10, 15, 20, 25, 0]

    private var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)

        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }

    private var totalToPay: Double {
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let totalToPay = checkAmount + tipValue
        return totalToPay
    }

    private var tipValue: Double {
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        return tipValue
    }

    private var currentCurrencyIdentifier: FloatingPointFormatStyle<Double>.Currency {
        return .currency(code: Locale.current.currency?.identifier ?? "USD")
    }

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: currentCurrencyIdentifier)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                }

                Picker("Number of people", selection: $numberOfPeople) {
                    ForEach(2..<100) {
                        Text("\($0) people")
                    }
                }

                Section {
                    let tipStride = stride(from: 0, to: 102, by: 2)

                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(Array(tipStride), id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.menu)
                } header: {
                    Text("How much tip do you want to leave?")
                }

                Section {
                    Text(totalPerPerson, format: currentCurrencyIdentifier)
                } header: {
                    Text("Amount per preson")
                }

                Section {
                    Text("Tip amount: \(tipValue, specifier: "%.2f")")
                    Text("Total bill + tip: \(totalToPay, specifier: "%.2f")")
                } header: {
                    Text("Payment breakdown")
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()

                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }

        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

