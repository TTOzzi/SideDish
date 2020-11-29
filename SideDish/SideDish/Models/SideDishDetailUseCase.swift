//
//  SideDishDetailUseCase.swift
//  SideDish
//
//  Created by TTOzzi on 2020/11/29.
//

import Combine
import Foundation

protocol SideDishDetailUseCaseType {
    func load(detailHash: String) -> AnyPublisher<SideDishInfo, UseCaseError>
}

struct SideDishDetailUseCase {
    private let networkService: NetworkServiceType
    
    init(networkService: NetworkServiceType = NetworkService()) {
        self.networkService = networkService
    }
    
    func load(detailHash: String) -> AnyPublisher<SideDishInfo, UseCaseError> {
        let endPoint = EndPoint(path: .detail(hash: detailHash))
        
        return networkService.request(with: endPoint)
            .decode(type: SideDishInfoResponse.self, decoder: JSONDecoder())
            .map(\.data)
            .mapError { error -> UseCaseError in
                if let networkError = error as? NetworkError {
                    return .networkError(message: networkError.localizedDescription)
                }
                
                return .decodeError
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
