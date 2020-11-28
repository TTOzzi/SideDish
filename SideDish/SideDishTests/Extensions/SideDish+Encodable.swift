//
//  SideDish+Encodable.swift
//  SideDishTests
//
//  Created by TTOzzi on 2020/11/29.
//

import Foundation
@testable import SideDish

extension SideDishResponse: Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(body, forKey: .body)
    }
    
    enum CodingKeys: String, CodingKey {
        case body
    }
}

extension SideDish: Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(detailHash, forKey: .detailHash)
        try container.encode(imageURL, forKey: .imageURL)
        try container.encode(title, forKey: .title)
        try container.encode(description, forKey: .description)
        try container.encode(normalPrice, forKey: .normalPrice)
        try container.encode(salePrice, forKey: .salePrice)
        try container.encode(badge, forKey: .badge)
    }
}
