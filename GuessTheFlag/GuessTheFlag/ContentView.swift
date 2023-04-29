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
        VStack {
            ZStack {
                gradient
                helloWorld
//                backgroundVStack
            }
            delete
        }
    }

    private var gradient: some View {
        RadialGradient(gradient: .init(colors: [.blue, .black]),
                       center: .center,
                       startRadius: 20,
                       endRadius: 200)
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

    private var delete: some View {
        Button("Delete button") {
            print("Now deleting")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
