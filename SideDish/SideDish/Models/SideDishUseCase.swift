//
//  SideDishUseCase.swift
//  SideDish
//
//  Created by TTOzzi on 2020/11/28.
//

import Combine
import Foundation

enum UseCaseError: Error {
    case decodeError
    case networkError(message: String)
}

protocol SideDishUseCaseType {
    func load(endPoint: EndPoint) -> AnyPublisher<SideDishCategory, UseCaseError>
}

struct SideDishCategory: Identifiable {
    let id = UUID()
    let keyword: String
    let title: String
    let data: [SideDish]
}

struct SideDishUseCase: SideDishUseCaseType {
    private let networkService: NetworkServiceType
    
    init(networkService: NetworkServiceType = NetworkService()) {
        self.networkService = networkService
    }
    
    func load(endPoint: EndPoint) -> AnyPublisher<SideDishCategory, UseCaseError> {
        return networkService
            .request(with: endPoint)
            .decode(type: SideDishResponse.self, decoder: JSONDecoder())
            .map {
                SideDishCategory(keyword: endPoint.path.keyword,
                                title: endPoint.path.title,
                                data: $0.body)
            }
            .mapError{ error -> UseCaseError in
                if let networkError = error as? NetworkError {
                    return .networkError(message: networkError.localizedDescription)
                }
                
                return .decodeError
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
