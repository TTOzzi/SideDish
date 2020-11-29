//
//  SideDishInfoView.swift
//  SideDish
//
//  Created by TTOzzi on 2020/11/29.
//

import SwiftUI

struct SideDishInfoView: View {
    let title: String
    let info: SideDishInfo
    
    var body: some View {
        let padding: CGFloat = 12
        VStack(alignment: .leading) {
            VStack(alignment: .leading,
                   spacing: 4) {
                Text(title)
                    .font(.system(size: 20, weight: .bold))
                Text(info.description)
                    .font(.system(size: 16))
            }
            .padding(.horizontal, padding)
            Rectangle()
                .foregroundColor(Color.gray.opacity(0.3))
                .frame(height: 4)
            VStack(alignment: .leading,
                   spacing: 6) {
                HStack {
                    Text("가격")
                        .font(.system(size: 18))
                    Spacer()
                    if !info.prices.isEmpty {
                        PriceView(normalPrice: info.prices.count > 1 ? info.prices.first : nil,
                                  salePrice: info.prices[info.prices.count - 1])
                    }
                }
                infoDescription("적립금", info.point)
                infoDescription("배송비", info.deliveryFee)
                infoDescription("배송정보", info.deliveryInfo)
            }
            .padding(.horizontal, padding)
        }
        .lineLimit(1)
    }
    
    private func infoDescription(_ title: String,
                                 _ description: String) -> some View {
        HStack {
            Text(title)
                .font(.system(size: 18))
                .frame(minWidth: 80, alignment: .leading)
            Text(description)
                .subtitle()
        }
    }
}

struct SideDishInfoView_Previews: PreviewProvider {
    static var previews: some View {
        SideDishInfoView(title: "[모이세] 육개장 1팩(600g)",
                         info: SideDishInfo(
                            thumbImages: [],
                            description: "제주3대해장국 맛집의 인기메뉴",
                            point: "44원",
                            deliveryInfo: "서울 경기 새벽배송 / 전국택배 (제주 및 도서산간 불가) [월 · 화 · 수 · 목 · 금 · 토] 수령 가능한 상품입니다." ,
                            deliveryFee: "2,500원 (40,000원 이상 구매 시 무료)",
                            prices: ["5,900원", "4,400원"],
                            detailImages: []
                         )
        )
    }
}
