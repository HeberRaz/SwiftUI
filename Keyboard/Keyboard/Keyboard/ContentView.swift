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
//                if string.count > 3 {
//                    textfield.next(textfield)
//                }
            } didEndEditing: {
                print("focus 1")
            }
            .frame(height: 24)

            FocusableTextField($focusableTextField, tag: 1, placeholder: "focus 2") {  (textfield, string) in
                print(string)
            } didEndEditing: {
                print("focus 2")
            }
            .frame(height: 24)

            FocusableTextField($focusableTextField, tag: 2, placeholder: "focus 3") {  (textfield, string) in
                print(string)
            } didEndEditing: {
                print("focus 3")
            }
            .frame(height: 24)
        }
        .keyboardToolbar {
            HStack {
                Button("Tap me") {
                    focusableTextField.next(focusableTextField)
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
