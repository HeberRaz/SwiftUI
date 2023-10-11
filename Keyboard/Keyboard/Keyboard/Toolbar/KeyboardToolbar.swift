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
        ZStack(alignment: .bottom) {
            VStack {
                GeometryReader { geometry in
                    VStack {
                        content
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height - height)
                }
                if showContent {
                    toolbarView
                        .background(
                            GeometryReader { proxy in
                                Color.clear
                                    .onChange(of: proxy.size.height, perform: { newValue in
                                        height = newValue
                                    })
                            }
                        )
                }
            }
        }
        .onReceive(Publishers.keyboardRect, perform: { newValue in
            if newValue == true {
                showContent = true
            } else {
                showContent = false
            }

        })
        .frame(maxWidth: .infinity, maxHeight: .infinity)
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
