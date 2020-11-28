//
//  NetworkError+Equatable.swift
//  SideDishTests
//
//  Created by TTOzzi on 2020/11/28.
//

import Foundation
@testable import SideDish

extension NetworkError: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        switch (lhs, rhs) {
        case (.httpError, .httpError):
            return true
        case (.unknownError, .unknownError):
            return true
        default:
            return false
        }
    }
}
