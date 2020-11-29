//
//  PriceView.swift
//  SideDish
//
//  Created by TTOzzi on 2020/11/29.
//

import SwiftUI

struct PriceView: View {
    let normalPrice: String?
    let salePrice: String
    
    var body: some View {
        HStack {
            if let normalPrice = normalPrice {
                Text(normalPrice)
                    .strikethrough()
                    .subtitle()
            }
            
            Text(salePrice)
                .foregroundColor(.keyColor)
                .font(.rowTitle)
        }
    }
}

struct PriceView_Previews: PreviewProvider {
    static var previews: some View {
        PriceView(normalPrice: "5,900원", salePrice: "4,400원")
    }
}
