//
//  SideDishHome.swift
//  SideDish
//
//  Created by TTOzzi on 2020/11/28.
//

import Combine
import SwiftUI

struct SideDishHome: View {
    @ObservedObject var viewModel = SideDishViewModel()
    
    var body: some View {
        content
        .onAppear {
            viewModel.send(event: .appear)
        }
    }
    
    private var content: some View {
        switch viewModel.state {
        case .idle:
            return AnyView(Color.clear)
        case let .loading(data):
            return AnyView(SideDishList(data: data))
        case let .loaded(data):
            return AnyView(SideDishList(data: data))
        case let .error(message):
            return AnyView(Text(message))
        }
    }
}

struct SideDishHome_Previews: PreviewProvider {
    static var previews: some View {
        SideDishHome()
            .paddingStatusBar()
    }
}
