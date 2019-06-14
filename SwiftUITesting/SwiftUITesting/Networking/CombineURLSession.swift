//
//  CombineURLSession.swift
//  SwiftUITesting
//
//  Created by Federico Ojeda on 6/12/19.
//  Copyright © 2019 Federico Ojeda. All rights reserved.
//

import SwiftUI
import Combine

enum RequestError: Error {
    case request(code: Int, error: Error?)
    case unknown
    case decoding
}

extension URLSession {
    
    func request(request: URLRequest) -> Publishers.Future<Data, RequestError> {
        Publishers.Future { promise in
            let task = self.dataTask(with: request) { [weak self] data, response, error in
                DispatchQueue.main.async {
                    self?.processResponse(
                        data: data,
                        response: response,
                        error: error,
                        promise: promise
                    )
                }
            }
            task.resume()
        }
    }
    
    private func processResponse(data: Data?, response: URLResponse?, error: Error?, promise: @escaping (Result<Data, RequestError>) -> Void) -> Void {
        guard let httpReponse = response as? HTTPURLResponse else {
            promise(.failure(.unknown))
            return
        }
        
        guard let data = data, 200..<300 ~= httpReponse.statusCode else {
            promise(.failure(.request(code: httpReponse.statusCode, error: error)))
            return
        }
        
        promise(.success(data))
    }
    
}

extension JSONDecoder: TopLevelDecoder {}
