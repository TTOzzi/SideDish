//
//  PagingView.swift
//  SideDish
//
//  Created by TTOzzi on 2020/11/29.
//

import SwiftUI
import KingfisherSwiftUI

struct PagingView: View {
    let imageURLs: [String]
    
    var body: some View {
        GeometryReader { proxy in
            TabView {
                ForEach(imageURLs, id: \.self) { image in
                    KFImage(URL(string: image))
                        .resizable()
                        .scaledToFill()
                        .frame(width: proxy.size.width,
                               height: proxy.size.height)
                }
            }
            .tabViewStyle(PageTabViewStyle())
        }
    }
}
