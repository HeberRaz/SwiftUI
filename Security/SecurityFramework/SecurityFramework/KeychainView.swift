//
//  KeychainView.swift
//  SecurityFramework
//
//  Created by Heber Alvarez on 15/04/24.
//

import SwiftUI

struct KeychainView: View {
    @Environment(\.dismiss) var dismiss
    @State private var showNextView = false

    var body: some View {
        NavigationStack {
            Text("Keychain View")
            Button("Testing button") {
                showNextView = true
            }
            Button("Go back") {
                dismiss()
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                    }

                }
            }
        }
    }
}
