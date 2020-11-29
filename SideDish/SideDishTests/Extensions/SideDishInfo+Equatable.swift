//
//  SideDishInfo+Equatable.swift
//  SideDishTests
//
//  Created by TTOzzi on 2020/11/29.
//

import Foundation
@testable import SideDish

extension SideDishInfo: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.thumbImages == rhs.thumbImages &&
            lhs.description == rhs.description &&
            lhs.point == rhs.point &&
            lhs.deliveryInfo == rhs.deliveryInfo &&
            lhs.deliveryFee == rhs.deliveryFee &&
            lhs.prices == rhs.prices &&
            lhs.detailImages == rhs.detailImages
    }
}
