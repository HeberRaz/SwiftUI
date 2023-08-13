//
//  Constant.swift
//  GitHubApp
//
//  Created by Heber Alvarez on 12/08/23.
//

import Foundation
import Security

struct Constant {
    struct User {
        static let username = "HeberRaz"
    }

    struct APIKey {
        static var gitHubAccessToken: String {
            guard let tokenData = KeyChainHelper.shared.read(service: "access-token", account: "GitHub"),
                  let token = String(data: tokenData, encoding: .utf8)
            else { return "" }
            return token
        }
    }
}
