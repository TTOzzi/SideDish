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
    
    @ViewBuilder
    private var content: some View {
        switch viewModel.state {
        case .idle:
            Color.clear
        case let .loading(data):
            SideDishList(data: data)
        case let .loaded(data):
            SideDishList(data: data)
        case let .error(message):
            Text(message)
        }
    }
}

struct SideDishMainView_Previews: PreviewProvider {
    static var previews: some View {
        SideDishMainView()
    }
}
