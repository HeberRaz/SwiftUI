//
//  HighlightedTooltip.swift
//  CustomTip
//
//  Created by Heber Alvarez on 26/04/24.
//

import SwiftUI

struct HighlightedTooltip: View {
    private let title: String
    private let subtitle: String
    private let buttonTitle: String
    private let onTapButton: () -> Void

    /// Initializes a `HighlightedTooltip` view.
    /// - Parameters:
    ///   - title: Represents the String value that will display the bolded title at the top.
    ///   - subtitle: A String value displayed below the title.
    ///   - buttonTitle: A String value that provides the button with a custom title.
    ///   - onTapButton: A closure called when the user taps the button.
    init (
        title: String,
        subtitle: String,
        buttonTitle: String,
        onTapButton: @escaping () -> Void
    ) {
        self.title = title
        self.subtitle = subtitle
        self.buttonTitle = buttonTitle
        self.onTapButton = onTapButton
    }
    var body: some View {
        VStack(alignment: .leading, spacing: .zero) {
            trianglePoint
            tooltipContent
        }
        .frame(width: 187.0)
    }
}

extension HighlightedTooltip {
    private var trianglePoint: some View {
        HStack {
            Triangle()
                .fill(.cyan)
                .frame(width: 24, height: 16)
                .padding(.leading, 8)
            Spacer()
        }
    }

    private var tooltipContent: some View {
        VStack(alignment: .leading, spacing: 8) {

            Text(title)
            Text(subtitle)

            HStack {
                Spacer()
                Button {
                    onTapButton()
                } label: {
                    Text(buttonTitle)
                }
            }
        }
        .padding()
        .frame(width: 187.0)
        .background(.cyan)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

private struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

        return path
    }
}

