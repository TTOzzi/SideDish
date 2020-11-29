//
//  SideDishDetailView.swift
//  SideDish
//
//  Created by TTOzzi on 2020/11/29.
//

import SwiftUI
import KingfisherSwiftUI

struct SideDishDetailView: View {
    let title: String
    let data: SideDishInfo
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                VStack {
                    PagingView(imageURLs: data.thumbImages)
                        .frame(width: proxy.size.width,
                               height: proxy.size.height * 0.25)
                    SideDishInfoView(title: title,
                                     info: data)
                        .padding(.horizontal)
                    ForEach(data.detailImages, id: \.self) { image in
                        KFImage(URL(string: image))
                            .resizable()
                            .scaledToFill()
                            .frame(width: proxy.size.width)
                    }
                }
            }
        }
    }
}

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
