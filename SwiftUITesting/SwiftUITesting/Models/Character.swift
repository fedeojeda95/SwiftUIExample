//
//  Character.swift
//  SwiftUITesting
//
//  Created by Federico Ojeda on 6/12/19.
//  Copyright © 2019 Federico Ojeda. All rights reserved.
//

import Foundation
import SwiftUI

struct Character: Codable, Identifiable {
    var id = UUID()
    let name, height, mass, hairColor: String
    let skinColor, eyeColor, birthYear, gender: String
    let homeworld: String
    let films, species, vehicles, starships: [String]
    let created, edited: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case name, height, mass
        case hairColor = "hair_color"
        case skinColor = "skin_color"
        case eyeColor = "eye_color"
        case birthYear = "birth_year"
        case gender, homeworld, films, species, vehicles, starships, created, edited, url
    }
}
