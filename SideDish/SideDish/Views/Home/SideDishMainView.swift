//
//  SideDishMainView.swift
//  SideDish
//
//  Created by TTOzzi on 2020/11/28.
//

import Combine
import SwiftUI

struct SideDishMainView: View {
    @ObservedObject var viewModel = SideDishViewModel()
    
    var body: some View {
        NavigationView {
            content
                .navigationBarHidden(true)
                .paddingStatusBar()
        }
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

struct SideDishMainView_Previews: PreviewProvider {
    static var previews: some View {
        SideDishMainView()
    }
}
