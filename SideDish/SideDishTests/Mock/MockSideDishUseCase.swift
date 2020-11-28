//
//  MockSideDishUseCase.swift
//  SideDishTests
//
//  Created by TTOzzi on 2020/11/29.
//

import Combine
@testable import SideDish

struct MockSideDishUseCase: SideDishUseCaseType {
    let data: SideDishCategory
    
    func load(endPoint: EndPoint) -> AnyPublisher<SideDishCategory, UseCaseError> {
        return Just(data)
            .setFailureType(to: UseCaseError.self)
            .eraseToAnyPublisher()
    }
}

struct MockSideDishErrorUseCase: SideDishUseCaseType {
    func load(endPoint: EndPoint) -> AnyPublisher<SideDishCategory, UseCaseError> {
        return Fail(error: UseCaseError.decodeError)
            .eraseToAnyPublisher()
    }
}
