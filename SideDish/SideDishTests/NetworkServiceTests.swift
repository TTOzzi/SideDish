//
//  SideDishTests.swift
//  SideDishTests
//
//  Created by TTOzzi on 2020/11/28.
//

import XCTest
import Combine
@testable import SideDish

final class NetworkServiceTests: XCTestCase {
    
    private var subscriptions: Set<AnyCancellable> = []
    
    func test_request_success() {
        let expectation = XCTestExpectation()
        defer { wait(for: [expectation], timeout: 3) }
        let network = NetworkService()
        let request = URLRequest(url: URL(string: "https://h3rb9c0ugl.execute-api.ap-northeast-2.amazonaws.com/develop/baminchan/main")!)
        
        network.request(urlRequest: request)
            .sink { result in
                switch result {
                case .failure:
                    XCTFail("networking failure")
                case .finished:
                    expectation.fulfill()
                }
            } receiveValue: { _ in

            }
            .store(in: &subscriptions)
    }
    
    func test_request_failure() {
        let expectation = XCTestExpectation()
        defer { wait(for: [expectation], timeout: 3) }
        let network = NetworkService()
        let request = URLRequest(url: URL(string: "test")!)
        
        network.request(urlRequest: request)
            .sink { result in
                switch result {
                case let .failure(error):
                    XCTAssertEqual(error, .unknownError(message: ""))
                    expectation.fulfill()
                case .finished:
                    XCTFail("networking success")
                }
            } receiveValue: { _ in

            }
            .store(in: &subscriptions)
    }
}
