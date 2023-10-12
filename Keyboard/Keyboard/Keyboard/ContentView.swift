//
//  ContentView.swift
//  Keyboard
//
//  Created by Heber Alvarez on 29/09/23.
//

import SwiftUI

struct ContentView: View {
    enum FocusedField {
        case username, goodbyeText
    }

    @State private var username: String = ""
    @State private var goodbyeText: String = ""
    @State private var tag: Bool = false
    @FocusState private var focusedField: FocusedField?


    var body: some View {
        focusImpl()
    }

    func focusImpl() -> some View {
        VStack {
            TextField("username", text: $username)
                .myKeyboard(with: .alphabetical)
                .focused($focusedField, equals: .username)
            TextField("goodbyeText", text: $goodbyeText)
                .myKeyboard(with: .numerical)
                .focused($focusedField, equals: .goodbyeText)
        }
        .padding()
        .onSubmit {
            switch focusedField {
            case .username:
                focusedField = .goodbyeText
            default:
                break
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
