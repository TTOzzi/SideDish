//
//  SideDishDetailView.swift
//  SideDish
//
//  Created by TTOzzi on 2020/11/29.
//

import SwiftUI
import KingfisherSwiftUI

struct SideDishDetailView: View {
    let data: SideDishInfo
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                TabView {
                    ForEach(data.thumbImages, id: \.self) { image in
                        KFImage(URL(string: image))
                            .resizable()
                            .scaledToFill()
                            .frame(width: proxy.size.width,
                                   height: proxy.size.height * 0.3)
                    }
                }
                .frame(width: proxy.size.width,
                       height: proxy.size.height * 0.3)
            }
            .tabViewStyle(PageTabViewStyle())
        }
    }
}


struct SideDishDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SideDishDetailView(data: .init(thumbImages: [], description: "", point: "", deliveryInfo: "", deliveryFee: "", prices: [], detailImages: []))
    }
}
