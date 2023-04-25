//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Heber Alvarez on 28/03/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        textZStack
        .ignoresSafeArea()
    }

    private var textZStack: some View {
        ZStack {
            Color.mint
            Color.secondary
                .frame(minWidth: 200, maxWidth: .infinity, maxHeight: 400)
            helloWorld
            backgroundVStack
        }
    }

    private var helloWorld: some View {
        Text("Hello, world!")
            .foregroundStyle(.secondary)
            .padding(50)
            .background(.ultraThinMaterial)
    }

    private var backgroundVStack: some View {
        VStack(spacing: 0) {
            Color.green.opacity(0.3)
            Color.purple.opacity(0.3)
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
