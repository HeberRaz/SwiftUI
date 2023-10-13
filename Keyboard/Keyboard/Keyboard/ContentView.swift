//
//  ContentView.swift
//  Keyboard
//
//  Created by Heber Alvarez on 29/09/23.
//

import SwiftUI

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

//  Originally created by @valvolinne.
//  https://medium.com/@valv0/textfield-and-uiviewrepresentable-46a8d3ec48e2

import SwiftUI


extension UITextField {
    @objc  func next(_ textField: UITextField) {}
}

class WrappableTextField: UITextField, UITextFieldDelegate {

    var onChange: ((UITextField, String)->Void)?
    var didEndEditing: (()->Void)?

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextField = textField.superview?.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return false
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let currentValue = textField.text as NSString? {
            let proposedValue = currentValue.replacingCharacters(in: range, with: string)
            onChange?(textField, proposedValue)
        }
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        self.endEditing(true)
        didEndEditing?()
    }


    @objc override func next(_ textField: UITextField) {
        _ = textFieldShouldReturn(textField)
    }
}

struct CTextField: UIViewRepresentable {
    private let tmpView = WrappableTextField()

    var tag: Int = 0
    var placeholder: String?
    var changeHandler: ((UITextField, String)->Void)?
    var didEndEditing: (()->Void)?

    func makeUIView(context: UIViewRepresentableContext<CTextField>) -> WrappableTextField {
        tmpView.tag = tag
        tmpView.delegate = tmpView
        tmpView.placeholder = placeholder
        tmpView.didEndEditing = didEndEditing
        tmpView.onChange = changeHandler
        return tmpView
    }

    func updateUIView(_ uiView: WrappableTextField, context: UIViewRepresentableContext<CTextField>) {
    }
}


struct ContentView: View {
    @State var currentTextField: UITextField = .init()

    var body: some View {
        VStack {
            CTextField(tag: 0, placeholder: "focus 1") { (textfield, string) in
    //            if string.count > 3 {
    //                textfield.next(textfield)
    //            }
                currentTextField = textfield
            } didEndEditing: {
                print("focus 1")
            }
            .frame(height: 24)

            CTextField(tag: 1, placeholder: "focus 2") {  (textfield, string) in
                print(string)
                currentTextField = textfield
            } didEndEditing: {
                print("focus 2")
            }
            .frame(height: 24)

            CTextField(tag: 2, placeholder: "focus 3") {  (textfield, string) in
                print(string)
                currentTextField = textfield
            } didEndEditing: {
                print("focus 3")
            }
            .frame(height: 24)

            CTextField(tag: 3, placeholder: "focus 3") {  (textfield, string) in
                print(string)
                currentTextField = textfield
            } didEndEditing: {
                print("focus 4")
            }
            .frame(height: 24)
        }
        .keyboardToolbar {
            HStack {
                Button("Button1") {
                    print("--> Button 1")
                }
                Spacer()
                Button("Done") {
                    currentTextField.next(currentTextField)
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
