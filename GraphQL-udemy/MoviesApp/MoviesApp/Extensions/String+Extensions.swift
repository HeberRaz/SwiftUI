//
//  String+Extensions.swift
//  MoviesApp
//
//  Created by Heber Alvarez on 16/08/23.
//

import Foundation

extension String {
    func encoded() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
}
