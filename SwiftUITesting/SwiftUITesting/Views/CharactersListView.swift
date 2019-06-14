//
//  CharactersListView.swift
//  SwiftUITesting
//
//  Created by Federico Ojeda on 6/14/19.
//  Copyright © 2019 Federico Ojeda. All rights reserved.
//

import SwiftUI

struct CharacterListView: View {
    @ObjectBinding var charactersViewModel = CharactersViewModel()
    
    var body: some View {
        NavigationView {
            CharacterList(characters: charactersViewModel.charactersModel.characters)
                .navigationBarTitle(Text("Characters"))
                .onAppear {
                    self.charactersViewModel.getCharacters()
                }
            
            if charactersViewModel.charactersModel.isLoading {
                Text("Loading...")
            }
        }
    }
}

struct CharacterList: View {
    var characters: [Character] = []
    
    var body: some View {
        List(characters) { character in
            NavigationButton(destination: CharacterDetail(character: character)) {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Name: ")
                        Text(character.name)
                    }
                }
            }
        }
    }
}
