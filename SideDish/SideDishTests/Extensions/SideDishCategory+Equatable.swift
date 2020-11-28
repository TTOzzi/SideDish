//
//  SideDishCategory+Equatable.swift
//  SideDishTests
//
//  Created by TTOzzi on 2020/11/29.
//

import Foundation
@testable import SideDish

extension SideDishCategory: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.title == rhs.title &&
            lhs.keyword == rhs.keyword &&
            lhs.data == rhs.data
    }
}
