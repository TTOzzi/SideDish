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
    
    struct MockSuccessRequest: RequestProviding {
        var request: URLRequest? = URLRequest(url: URL(string: "https://h3rb9c0ugl.execute-api.ap-northeast-2.amazonaws.com/develop/baminchan/main")!)
    }
    
    struct MockFailureRequest: RequestProviding {
        var request: URLRequest? = URLRequest(url: URL(string: "test")!)
    }
    
    private var subscriptions: Set<AnyCancellable> = []
    
    func test_request_success() {
        let expectation = XCTestExpectation()
        defer { wait(for: [expectation], timeout: 3) }
        let network = NetworkService()
        let provider = MockSuccessRequest()
        
        network.request(with: provider)
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
    
    func test_request_failure_with_invaildURL() {
        let expectation = XCTestExpectation()
        defer { wait(for: [expectation], timeout: 3) }
        let network = NetworkService()
        let provider = MockFailureRequest()
        
        network.request(with: provider)
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
    
    func test_request_failure_with_invaildRequest() {
        let expectation = XCTestExpectation()
        defer { wait(for: [expectation], timeout: 3) }
        let network = NetworkService()
        var provider = MockFailureRequest()
        provider.request = nil
        
        network.request(with: provider)
            .sink { result in
                switch result {
                case let .failure(error):
                    XCTAssertEqual(error, .invaildRequest)
                    expectation.fulfill()
                case .finished:
                    XCTFail("networking success")
                }
            } receiveValue: { _ in

            }
            .store(in: &subscriptions)
    }
}
