//
//  KeyboardToolbar.swift
//  Keyboard
//
//  Created by Heber Alvarez on 29/09/23.
//

import Foundation
import SwiftUI
import Combine

struct KeyboardToolbar<ToolbarView: View>: ViewModifier {
    @State var  height: CGFloat = 0
    private let toolbarView: ToolbarView
    @State var showContent = false

    init(@ViewBuilder toolbar: () -> ToolbarView) {
        self.toolbarView = toolbar()
    }

    func body(content: Content) -> some View {
        ZStack {
                content
            if showContent {
                toolbarView
                    .background(Color.blue)
                    .position(x: 214, y: 156)
            }
        }
        .background(Color.orange)
        .onReceive(Publishers.keyboardRect, perform: { newValue in
            if newValue == true {
                showContent = true
            } else {
                showContent = false
            }
        })
    }
}

extension Publishers {
    static var keyboardRect: AnyPublisher<Bool, Never> {
        let willShow = NotificationCenter.default.publisher(for: UIApplication.keyboardWillShowNotification)
            .map { _ in return true }

        let willHide = NotificationCenter.default.publisher(for: UIApplication.keyboardWillHideNotification)
            .map { _ in return false}

        return MergeMany(willShow, willHide)
            .eraseToAnyPublisher()
    }
}
extension Notification {
    var keyboardRect: CGRect {
        return (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect) ?? .zero
    }
}
extension View {
    func keyboardToolbar<ToolbarView>(@ViewBuilder view:  @escaping  () -> ToolbarView) -> some View where ToolbarView: View {
        modifier(KeyboardToolbar(toolbar: view))
    }
}
