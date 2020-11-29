//
//  SideDishInfo+Encodable.swift
//  SideDishTests
//
//  Created by TTOzzi on 2020/11/29.
//

import Foundation
@testable import SideDish

extension SideDishInfoResponse: Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(data, forKey: .data)
    }
    
    enum CodingKeys: String, CodingKey {
        case data
    }
}

extension SideDishInfo: Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(thumbImages, forKey: .thumbImages)
        try container.encode(description, forKey: .description)
        try container.encode(point, forKey: .point)
        try container.encode(deliveryInfo, forKey: .deliveryInfo)
        try container.encode(deliveryFee, forKey: .deliveryFee)
        try container.encode(prices, forKey: .prices)
        try container.encode(detailImages, forKey: .detailImages)
    }
}
