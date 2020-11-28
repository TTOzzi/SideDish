//
//  SideDishViewModel.State+Equatable.swift
//  SideDishTests
//
//  Created by TTOzzi on 2020/11/29.
//

import Foundation
@testable import SideDish

extension SideDishViewModel.State: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        switch (lhs, rhs) {
        case (.idle, .idle):
            return true
        case let (.loading(lhsData), .loading(rhsData)):
            return lhsData == rhsData
        case let (.loaded(lhsData), .loaded(rhsData)):
            return lhsData == rhsData
        case (.error, .error):
            return true
        default:
            return false
        }
    }
}
