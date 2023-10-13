//
//  ContentView.swift
//  Keyboard
//
//  Created by Heber Alvarez on 29/09/23.
//

import SwiftUI
import UIKit

//struct ContentView: View {
//    enum FocusedField {
//        case username, goodbyeText
//    }
//
//    @State private var username: String = ""
//    @State private var goodbyeText: String = ""
//    @State private var tag: Bool = false
//    @FocusState private var focusedField: FocusedField?
//
//    var body: some View {
//        focusImpl
//    }
//
//    var focusImpl: some View {
//        VStack {
//            TextField("username", text: $username)
//                .myKeyboard(with: .alphabetical)
//                .focused($focusedField, equals: .username)
//            TextField("goodbyeText", text: $goodbyeText)
//                .myKeyboard(with: .numerical)
//                .focused($focusedField, equals: .goodbyeText)
//        }
//        .padding()
//        .onSubmit {
//            switch focusedField {
//            case .username:
//                focusedField = .goodbyeText
//            default:
//                break
//            }
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

struct ContentView: View {
    @State private var focusableTextField = UITextField()

    var body: some View {
        VStack {
            FocusableTextField($focusableTextField, tag: 0, placeholder: "focus 1") { (textfield, string) in
                print(string)
                focusableTextField = textfield
            }
            .frame(height: 24)

            FocusableTextField($focusableTextField, tag: 1, placeholder: "focus 2") {  (textfield, string) in
                print(string)
            }
            .frame(height: 24)

            FocusableTextField($focusableTextField, tag: 2, placeholder: "focus 3") {  (textfield, string) in
                print(string)
            }
            .frame(height: 24)

            FocusableTextField($focusableTextField, tag: 3, placeholder: "focus 4") {  (textfield, string) in
                print(string)
            }
            .frame(height: 24)
        }
        .keyboardToolbar {
            HStack {
                Text("El emi es chido - ")
                if let next = focusableTextField.superview?.superview?.viewWithTag(focusableTextField.tag + 1) as? UITextField {
                    // Baja
                    Button(action: {
                        focusableTextField.next(focusableTextField)
                    }) {
                        Image(systemName: "chevron.down")
                    }

                    Button(action: {
                        focusableTextField.previous(focusableTextField)
                    }) {
                        Image(systemName: "chevron.up")
                    }
                } else {
                    Button("Fui el ultimo tulipan") {
                        focusableTextField.next(focusableTextField)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
