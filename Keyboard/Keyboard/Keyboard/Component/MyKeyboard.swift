//
//  MyKeyboard.swift
//  Keyboard
//
//  Created by Heber Alvarez on 29/09/23.
//

import SwiftUI

struct MyKeyboard: ViewModifier {
    var style: KeyboardStyle
    @State var counter = 0

    init(style: KeyboardStyle) {
        self.style = style
    }

    func body(content: Content) -> some View {
        ZStack {
            content
                .keyboardType(getKeyboardType(from: style))
                .background(Color.yellow)
                .frame(maxHeight: 24)
                .autocorrectionDisabled(true)
        }
    }

    // MARK: - Helpers
    private func getKeyboardType(from keyboardStyle: KeyboardStyle) -> UIKeyboardType {
        switch keyboardStyle {
        case .email:
            return .emailAddress
        case .name:
            return .namePhonePad
        case .phoneNumber:
            return .phonePad
        }
    }
}

extension View {
    func myKeyboard(with style: KeyboardStyle) -> some View {
        modifier(MyKeyboard(style: style))
    }
}
