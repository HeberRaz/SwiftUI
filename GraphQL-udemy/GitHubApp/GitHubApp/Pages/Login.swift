//
//  Login.swift
//  GitHubApp
//
//  Created by Heber Alvarez on 13/08/23.
//

import SwiftUI
import Security

struct Login: View {
    @State private var secret: String = ""
    @State private var showRepositories = false

    var body: some View {
        HStack {
            Spacer()
            VStack(alignment: .center, spacing: 8) {
                TextField("Secret", text: $secret)
                    .padding()
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(8)
                Button(action: {
                    let savedTokenData = KeyChainHelper.shared.read(service: "access-token", account: "GitHub")
                    if savedTokenData != nil {
                        showRepositories = true
                    } else {
                        let data = Data(secret.utf8)
                        KeyChainHelper.shared.save(data, service: "access-token", account: "GitHub")
                    }
                }) {
                    Text("Go")
                        .foregroundColor(Color.black)
                }
                .padding()
                .background(Color.init(red: 0.1, green: 0.3, blue: 0.7)).opacity(0.3)
                .cornerRadius(8)
            }
            .frame(width: 320)
            .cornerRadius(8)
            .fullScreenCover(isPresented: $showRepositories, content: ContentView.init)
            Spacer()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
