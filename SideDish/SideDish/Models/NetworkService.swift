//
//  NetworkService.swift
//  SideDish
//
//  Created by TTOzzi on 2020/11/28.
//

import Combine
import Foundation

enum NetworkError: Error {
    case httpError
    case unknownError(message: String)
}

protocol NetworkServiceType {
    func request(urlRequest: URLRequest) -> AnyPublisher<Data, NetworkError>
}

final class NetworkService: NetworkServiceType {
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func request(urlRequest: URLRequest) -> AnyPublisher<Data, NetworkError> {
        session.dataTaskPublisher(for: urlRequest)
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    throw NetworkError.httpError
                }
                
                return data
            }
            .mapError { error in
                if let error = error as? NetworkError {
                    return error
                }
                
                return .unknownError(message: error.localizedDescription)
            }
            .eraseToAnyPublisher()
    }
}
