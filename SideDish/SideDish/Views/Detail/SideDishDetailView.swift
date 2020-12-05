//
//  SideDishDetailView.swift
//  SideDish
//
//  Created by TTOzzi on 2020/11/29.
//

import SwiftUI
import KingfisherSwiftUI

struct SideDishDetailView: View {
    init(viewModel: SideDishDetailViewModel) {
        self.viewModel = viewModel
        UIScrollView.appearance().bounces = false
        UINavigationBar.appearance().backgroundColor = .white
        UINavigationBar.appearance().tintColor = .black
    }
    
    @ObservedObject private var viewModel: SideDishDetailViewModel
    
    var body: some View {
        content
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                viewModel.send(event: .appear)
            }
    }
    
    @ViewBuilder
    var content: some View {
        switch viewModel.state {
        case .idle:
            Color.clear
        case let .loaded(title, data):
            detailView(title: title, data: data)
        case let .error(message):
            Text(message)
        }
    }
    
    private func detailView(title: String, data: SideDishInfo) -> some View {
        GeometryReader { proxy in
            ScrollView {
                VStack {
                    PagingView(imageURLs: data.thumbImages)
                        .frame(width: proxy.size.width,
                               height: proxy.size.height * 0.3)
                    SideDishInfoView(title: title,
                                     info: data)
                        .padding(.horizontal, 6)
                        .padding(.top, 4)
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

struct SideDishDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SideDishDetailView(
                viewModel: .init(sideDish: SideDish(detailHash: "HBDEF", imageURL: "", title: "제목", description: "", normalPrice: nil, salePrice: "", badge: nil)))
        }
    }
}
