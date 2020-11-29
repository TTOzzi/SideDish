//
//  MockNetworkService.swift
//  SideDishTests
//
//  Created by TTOzzi on 2020/11/29.
//

import Combine
import Foundation
@testable import SideDish

struct MockSuccessNetworkService<T: Codable>: NetworkServiceType {
    let response: T
    
    func request(with provider: RequestProviding) -> AnyPublisher<Data, NetworkError> {
        let data = try! JSONEncoder().encode(response)
        return Just(data)
            .setFailureType(to: NetworkError.self)
            .eraseToAnyPublisher()
    }
}

struct MockFailureNetworkService: NetworkServiceType {
    let response: Data?
    
    func request(with provider: RequestProviding) -> AnyPublisher<Data, NetworkError> {
        guard let response = response else {
            return Fail(error: NetworkError.invaildRequest)
                .eraseToAnyPublisher()
        }
        
        return Just(response)
            .setFailureType(to: NetworkError.self)
            .eraseToAnyPublisher()
    }
}
