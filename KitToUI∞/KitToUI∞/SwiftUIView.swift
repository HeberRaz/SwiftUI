//
//  SwiftUIView.swift
//  KitToUI∞
//
//  Created by Heber Alvarez on 29/04/23.
//

import SwiftUI

struct SwiftUIView: View {
    @EnvironmentObject var notifier: EventMessenger

    var body: some View {
        VStack {
            Text("This is a SwiftUI Control.\nTotal taps are \(notifier.tapCount)")
            Button("Tap Me") {
                notifier.tapCount += 1
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .background(Color.gray.opacity(0.3))
        .cornerRadius(8)
    }
}
