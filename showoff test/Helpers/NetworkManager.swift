//
//  NetworkManager.swift
//  showoff test
//
//  Created by Yona Harel on 27/01/2022.
//

import Foundation
import Combine

struct HTTPClient {
    let session: URLSession
    
    func perform<T: Decodable>(_ request: URLRequest, _ decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<T, Error> {
        return session.dataTaskPublisher(for: request)
            .retry(3)
            .tryMap { result -> T in
                let data = try decoder.decode(T.self, from: result.data)
                return data
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}



