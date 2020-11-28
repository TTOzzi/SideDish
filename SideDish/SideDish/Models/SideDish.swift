//
//  SideDish.swift
//  SideDish
//
//  Created by TTOzzi on 2020/11/28.
//

import Foundation

struct SideDishResponse: Decodable {
    let body: [SideDish]
}

struct SideDish: Decodable, Hashable {
    let detailHash: String
    let image: String
    let title: String
    let description: String
    let normalPrice: String?
    let salePrice: String
    let badge: [String]?
    
    enum CodingKeys: String, CodingKey {
        case detailHash = "detail_hash"
        case image
        case title
        case description
        case normalPrice = "n_price"
        case salePrice = "s_price"
        case badge
    }
}
