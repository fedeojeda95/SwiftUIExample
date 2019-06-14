//
//  CharactersResponse.swift
//  SwiftUITesting
//
//  Created by Federico Ojeda on 6/12/19.
//  Copyright © 2019 Federico Ojeda. All rights reserved.
//

import Foundation

struct CharacterResponse: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Character]
}
