//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Heber Alvarez on 28/03/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.mint
            Color.secondary
                .frame(minWidth: 200, maxWidth: .infinity, maxHeight: 400)
            Text("Hello, world!")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
