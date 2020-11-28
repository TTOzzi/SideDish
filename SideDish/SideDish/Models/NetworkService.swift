//
//  NetworkService.swift
//  SideDish
//
//  Created by TTOzzi on 2020/11/28.
//

import Combine
import Foundation

enum NetworkError: Error {
    case invaildRequest
    case httpError
    case unknownError(message: String)
}

protocol RequestProviding {
    var request: URLRequest? { get }
}

protocol NetworkServiceType {
    func request(with provider: RequestProviding) -> AnyPublisher<Data, NetworkError>
}

final class NetworkService: NetworkServiceType {
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func request(with provider: RequestProviding) -> AnyPublisher<Data, NetworkError> {
        guard let request = provider.request else {
            return Fail(error: .invaildRequest)
                .eraseToAnyPublisher()
        }
        
        return session.dataTaskPublisher(for: request)
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
