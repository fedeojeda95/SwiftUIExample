//
//  CharacterDetail.swift
//  SwiftUITesting
//
//  Created by Federico Ojeda on 6/13/19.
//  Copyright © 2019 Federico Ojeda. All rights reserved.
//

import SwiftUI

struct CharacterDetail : View {
    let character: Character
    
    var body: some View {
        VStack {
            HStack {
                Text("Homeworld: ")
                Text(character.homeworld)
            }
            Divider()
            HStack {
                Text("Eye color: ")
                Text(character.eyeColor)
            }
            Divider()
            HStack {
                Text("Hair color: ")
                Text(character.hairColor)
            }
            Divider()
            HStack {
                Text("Height: ")
                Text(character.height)
            }
            Divider()
            HStack {
                Text("Mass: ")
                Text(character.mass)
            }
        }
        .navigationBarTitle(Text(character.name))
    }
}
