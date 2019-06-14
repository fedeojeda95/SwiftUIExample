//
//  APIManager.swift
//  SwiftUITesting
//
//  Created by Federico Ojeda on 6/12/19.
//  Copyright © 2019 Federico Ojeda. All rights reserved.
//

import Combine
import Foundation

private struct NetworkingConstants {
    static let baseURL = "https://swapi.co/api/"
    static let peoplePath = "people"
    static let planetsPath = "planets"
}

enum APIError: Error {
    case networking
    case decoding
}

struct APIManager {
    
    static let shared = APIManager()

    func getCharacters() -> AnyPublisher<[Character], APIError>?  {
        guard let request = createRequest(for: NetworkingConstants.peoplePath) else {
            return nil
        }
        
        return URLSession.shared.request(request: request)
            .decode(type: CharacterResponse.self, decoder: JSONDecoder())
            .map { characterResponse in
                characterResponse.results
            }
            .mapError { error in
                guard error is RequestError else {
                    return APIError.networking
                }
                
                return APIError.decoding
            }
            .eraseToAnyPublisher()
    }
    
    func getPlanets() {
        
    }
    
    private func createRequest(for path: String) -> URLRequest? {
        guard
            let serviceComponents = URLComponents(string: "\(NetworkingConstants.baseURL)\(path)"),
            let serviceURL = serviceComponents.url
            else {
                return nil
        }
        
        var request = URLRequest(url: serviceURL)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        return request
    }
}
