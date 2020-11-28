//
//  SideDish.swift
//  SideDish
//
//  Created by TTOzzi on 2020/11/28.
//

import Foundation

struct SideDish {
    let detailHash: String
    let image: String
    let title: String
    let description: String
    let normalPrice: String?
    let salePrice: String
    let badge: [String]
}

extension SideDish {
    static let mockData = [SideDish](
        repeating: SideDish(
            detailHash: "HBDEF",
            image: "dish",
            title: "[미노리키친] 규동 250g",
            description: "일본인의 소울푸드! 한국인도 좋아하는 소고기덮밥",
            normalPrice: "6,500",
            salePrice: "7,000원",
            badge: [
                "론칭 특가",
                "이벤트 특가"
            ]
        ),
        count: 10
    )
}
