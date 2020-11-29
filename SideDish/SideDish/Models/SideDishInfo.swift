//
//  SideDishInfo.swift
//  SideDish
//
//  Created by TTOzzi on 2020/11/29.
//

import Foundation

struct SideDishInfoResponse: Decodable {
    let data: SideDishInfo
}

struct SideDishInfo: Decodable {
    let thumbImages: [String]
    let description: String
    let point: String
    let deliveryInfo: String
    let deliveryFee: String
    let prices: [String]
    let detailImages: [String]
    
    enum CodingKeys: String, CodingKey {
        case thumbImages = "thumb_images"
        case description = "product_description"
        case point
        case deliveryInfo = "delivery_info"
        case deliveryFee = "delivery_fee"
        case prices
        case detailImages = "detail_section"
    }
}
