//
//  SideDishDetail.swift
//  SideDish
//
//  Created by TTOzzi on 2020/11/29.
//

import SwiftUI

struct SideDishDetail: View {
    init(viewModel: SideDishDetailViewModel) {
        self.viewModel = viewModel
        UIScrollView.appearance().bounces = false
    }
    
    @ObservedObject private var viewModel: SideDishDetailViewModel
    
    var body: some View {
        content
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                viewModel.send(event: .appear)
            }
    }
    
    var content: some View {
        switch viewModel.state {
        case .idle:
            return AnyView(Color.clear)
        case let .loaded(title, data):
            return AnyView(SideDishDetailView(title: title, data: data))
        case let .error(message):
            return AnyView(Text(message))
        }
    }
}

struct SideDishDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SideDishDetail(
                viewModel: .init(sideDish: SideDish(detailHash: "HBDEF", imageURL: "", title: "", description: "", normalPrice: nil, salePrice: "", badge: nil)))
        }
    }
}
