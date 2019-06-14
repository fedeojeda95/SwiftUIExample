//
//  CharactersListViewModel.swift
//  SwiftUITesting
//
//  Created by Federico Ojeda on 6/13/19.
//  Copyright © 2019 Federico Ojeda. All rights reserved.
//
import Combine
import SwiftUI

class CharactersModel {
    
    let notificator: PassthroughSubject<CharactersModel, Never>
    
    var characters: [Character] = [] {
        didSet {
            isLoading = false
            notificator.send(self)
        }
    }
    
    var error: Error? {
        didSet {
            notificator.send(self)
        }
    }
    
    var isLoading: Bool = false {
        didSet {
            notificator.send(self)
        }
    }
    
    init(notificator: PassthroughSubject<CharactersModel, Never>) {
        self.notificator = notificator
    }
}

class CharactersViewModel: BindableObject {
    
    let didChange = PassthroughSubject<CharactersModel, Never>()
    let charactersModel: CharactersModel
    
    private var getCharactersCancellable: Cancellable? {
        didSet {
            oldValue?.cancel()
        }
    }
    
    init() {
        charactersModel = CharactersModel(notificator: didChange)
    }
    
    func getCharacters() {
        charactersModel.isLoading = true
        getCharactersCancellable = APIManager.shared.getCharacters()
            .catch { [weak self] apiError -> AnyPublisher<[Character], Never> in
                self?.charactersModel.error = apiError
                return Publishers.Just([Character]())
                        .eraseToAnyPublisher()
            }
            .assign(to: \.characters, on: charactersModel)
    }
}
