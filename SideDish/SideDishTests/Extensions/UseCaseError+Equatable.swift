//
//  UseCaseError+Equatable.swift
//  SideDishTests
//
//  Created by TTOzzi on 2020/11/29.
//

import Foundation
@testable import SideDish

extension UseCaseError: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        switch (lhs, rhs) {
        case (.decodeError, .decodeError):
            return true
        case (.networkError, .networkError):
            return true
        default:
            return false
        }
    }
}
