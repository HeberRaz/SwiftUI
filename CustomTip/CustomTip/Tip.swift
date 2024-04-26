//
//  Tip.swift
//  CustomTip
//
//  Created by Heber Alvarez on 26/04/24.
//

import SwiftUI

struct Tip: ViewModifier {
    @State private var aiPillMinPosition: CGPoint = .zero
    @State private var tipMinPosition: CGPoint = .zero
    @State private var tipOffset: CGPoint = .zero

    @State private var tipSize: CGSize = .zero


    var tooltip: some View {
        HighlightedTooltip(title: "Title", subtitle: "sub", buttonTitle: "button") {
            print("hello")
        }
        .opacity(0.5)
        .background(
            GeometryReader { proxy in
                Color.clear
                    .onAppear {
                        let newValue = proxy.frame(in: .global)
                        tipMinPosition = CGPoint(x: newValue.minX, y: newValue.minY - 8)
                        tipSize = newValue.size
                        print("tipMinPosition", tipMinPosition)
                        print("tipSize height", tipSize.height)
                    }
            }
        )
    }

    func body(content: Content) -> some View {
        ZStack {
            content
                .background(
                    GeometryReader { proxy in
                        Color.clear
                            .onAppear {
                                let newValue = proxy.frame(in: .global)
                                aiPillMinPosition = CGPoint(x: newValue.minX, y: newValue.maxY)
                                print("aiPillMinPosition", aiPillMinPosition)
                            }
                    }
                )
            Color.red.frame(width: 2, height: 2 * tipSize.height + tipMinPosition.y)
                .allowsHitTesting(false)
                .offset(y: tipSize.height)
                .overlay {
                    tooltip
                        .offset(x: -tipMinPosition.x + aiPillMinPosition.x, y: aiPillMinPosition.y - tipMinPosition.y)
                }
        }
    }
}

extension View {
    func tip() -> some View {
        modifier(Tip())
    }
}

