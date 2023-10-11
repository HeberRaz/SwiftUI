//
//  ContentView.swift
//  Keyboard
//
//  Created by Heber Alvarez on 29/09/23.
//

import SwiftUI

struct ContentView: View {
    @State private var username: String = ""
    @State private var tag: Bool = false
    @State private var suggestedWords = [""]

    var body: some View {
        suggestedWordsImpl()
    }

    func generateSuggestions(userInput: String) -> [String] {
        // Use your predictive text model to generate suggested words or phrases
        // based on the user's input
        var suggestions = [String]()
        suggestions.append("Heber's Heart <3")
        return suggestions
    }

    func suggestedWordsImpl() -> some View {
        ZStack {
            HStack {
                ForEach(suggestedWords, id: \.self) { suggestion in
                    ZStack {
                        Color.gray
                            .frame(width: 428, height: 44)
                        Text(suggestion)
                            .background(Color.gray)
                    }

                }
            }
            .position(x: 214, y: 556)

            VStack {
                TextField("Username", text: $username, onEditingChanged: { value in
                    suggestedWords = generateSuggestions(userInput: $username.wrappedValue)
                })
                    .myKeyboard(with: .name)
                TextField("Surname", text: $username)
                    .myKeyboard(with: .phoneNumber)
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
