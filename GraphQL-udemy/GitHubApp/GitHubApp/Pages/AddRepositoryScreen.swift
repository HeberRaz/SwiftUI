//
//  AddRepositoryScreen.swift
//  GitHubApp
//
//  Created by Heber Alvarez on 12/08/23.
//

import SwiftUI
import Combine

struct AddRepositoryScreen: View {
    @Environment(\.isPresented) var isPresented
    @State private var name = ""
    @State private var description = ""
    @State private var visibility = "public"

    var body: some View {
        Form {
            TextField("Name", text: $name)
            TextField("Description", text: $description)

            Picker("Select", selection: $visibility) {
                Text("Public").tag("tag")
                Text("Private").tag("private")
            }
            .pickerStyle(.segmented)
        }
    }
}
