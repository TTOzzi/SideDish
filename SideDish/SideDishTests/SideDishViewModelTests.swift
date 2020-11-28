//
//  SideDishViewModelTests.swift
//  SideDishTests
//
//  Created by TTOzzi on 2020/11/29.
//

import XCTest
import Combine
@testable import SideDish

final class SideDishViewModelTests: XCTestCase {
    private var subscriptions: Set<AnyCancellable> = []
    
    func test_appear_event() {
        let category = SideDishCategory(keyword: "test", title: "test", data: [])
        let viewModel = SideDishViewModel(useCase: MockSideDishUseCase(data: category))
        var result = [SideDishViewModel.State]()
        viewModel.$state
            .sink { state in
                result.append(state)
            }
            .store(in: &subscriptions)
        viewModel.send(event: .appear)
        
        
        XCTAssertEqual(result, [.idle,
                                .loading(data: [category]),
                                .loading(data: [category, category]),
                                .loading(data: [category, category, category]),
                                .loaded(data: [category, category, category])])
    }
    
    func test_appear_event_with_error() {
        let viewModel = SideDishViewModel(useCase: MockSideDishErrorUseCase())
        var result = [SideDishViewModel.State]()
        viewModel.$state
            .sink { state in
                result.append(state)
            }
            .store(in: &subscriptions)
        viewModel.send(event: .appear)
        
        
        XCTAssertEqual(result, [.idle,
                                .error(message: "")])
    }
}
