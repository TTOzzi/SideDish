//
//  SideDishRow.swift
//  SideDish
//
//  Created by TTOzzi on 2020/11/28.
//

import SwiftUI
import KingfisherSwiftUI

struct SideDishRow: View {
    let sideDish: SideDish
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            KFImage(URL(string:sideDish.imageURL))
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .frame(width: 100)
                .clipShape(Circle())
                .padding(.horizontal)
            
            VStack(alignment: .leading) {
                Text(sideDish.title)
                    .foregroundColor(.black)
                    .font(.rowTitle)
                    .lineLimit(1)
                
                Text(sideDish.description)
                    .subtitle()
                    .lineLimit(1)
                
                PriceView(normalPrice: sideDish.normalPrice,
                          salePrice: sideDish.salePrice)
                if let badges = sideDish.badge {
                    HStack {
                        ForEach(badges, id: \.self) { badge in
                            Badge(title: badge, textColor: .white, backgroundColor: .purple)
                        }
                    }
                }
            }
            
            Spacer()
        }
        .padding(.vertical)
    }
}

struct SideDishRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SideDishRow(sideDish: .init(
                            detailHash: "HBDEF",
                            imageURL: "dish",
                            title: "[미노리키친] 규동 250g", description: "일본인의 소울푸드! 한국인도 좋아하는 소고기덮밥",
                            normalPrice: "7,000",
                            salePrice: "6,500원",
                            badge: ["이벤트특가", "론칭특가"])
            )
            
            SideDishRow(sideDish: .init(
                            detailHash: "HBDEF",
                            imageURL: "dish",
                            title: "[미노리키친] 규동 250g", description: "일본인의 소울푸드! 한국인도 좋아하는 소고기덮밥",
                            normalPrice: "7,000",
                            salePrice: "6,500원",
                            badge: nil)
            )
        }
        .previewLayout(.fixed(width: 400, height: 120))
    }
}
