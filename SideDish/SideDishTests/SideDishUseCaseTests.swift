//
//  SideDishUseCaseTests.swift
//  SideDishTests
//
//  Created by TTOzzi on 2020/11/29.
//

import XCTest
import Combine
@testable import SideDish

final class SideDishUseCaseTests: XCTestCase {
    private var subscriptions: Set<AnyCancellable> = []

    func test_load_success() {
        let expectation = XCTestExpectation()
        defer { wait(for: [expectation], timeout: 3) }
        let response = SideDishResponse(
            body: [SideDish(detailHash: "test",
                            imageURL: "test",
                            title: "test",
                            description: "test",
                            normalPrice: nil,
                            salePrice: "test",
                            badge: nil)]
        )
        let useCase = SideDishUseCase(networkService: MockSuccessNetworkService(response: response))
        useCase.load(category: .main)
            .map(\.data)
            .sink { result in
                switch result {
                case .failure:
                    XCTFail()
                case .finished:
                    expectation.fulfill()
                }
            } receiveValue: { data in
                XCTAssertEqual(data, response.body)
            }
            .store(in: &subscriptions)
    }
    
    func test_load_failure_with_network_error() {
        let expectation = XCTestExpectation()
        defer { wait(for: [expectation], timeout: 3) }
        let useCase = SideDishUseCase(networkService: MockFailureNetworkService(response: nil))
        useCase.load(category: .main)
            .sink { result in
                switch result {
                case let .failure(error):
                    XCTAssertEqual(error, .networkError(message: ""))
                    expectation.fulfill()
                case .finished:
                    XCTFail()
                }
            } receiveValue: { data in
                XCTFail()
            }
            .store(in: &subscriptions)
    }
    
    func test_load_failure_with_decode_error() {
        let expectation = XCTestExpectation()
        defer { wait(for: [expectation], timeout: 3) }
        let useCase = SideDishUseCase(networkService: MockFailureNetworkService(response: Data()))
        useCase.load(category: .main)
            .sink { result in
                switch result {
                case let .failure(error):
                    XCTAssertEqual(error, .decodeError)
                    expectation.fulfill()
                case .finished:
                    XCTFail()
                }
            } receiveValue: { data in
                XCTFail()
            }
            .store(in: &subscriptions)
    }
}
