//
//  ContentView.swift
//  CustomTip
//
//  Created by Heber Alvarez on 26/04/24.
//

import SwiftUI

struct ContentView: View {
    @State var aiPillSize: CGSize = .zero
    @State var tipSize: CGSize = .zero

    var body: some View {
        VStack {
            Bar()
                .zIndex(1)
            tools
        }
    }

    var tools: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<15) { _ in
                    pill
                }
            }
            .padding()
        }
    }
}

struct Bar: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                aiPill
                    .tip()
                pill
                pill
            }
            .padding()
        }
        .frame(height: 50)
        .background(Color.green)
    }

    private var aiPill: some View {
        HStack {
            Text("AI Pill")
                .frame(maxWidth: .infinity)
                .background(Color.yellow)
        }
    }
}

var pill: some View {
    HStack {
        Text("Pill")
            .frame(maxWidth: .infinity)
            .background(Color.purple)
    }
}

#Preview {
    ContentView()
}
