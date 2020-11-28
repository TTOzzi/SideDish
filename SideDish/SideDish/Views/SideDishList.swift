//
//  SideDishList.swift
//  SideDish
//
//  Created by TTOzzi on 2020/11/28.
//

import Combine
import SwiftUI

struct SideDishList: View {
    @ObservedObject var viewModel = SideDishListViewModel(useCase: SideDishUseCase(networkService: NetworkService()))
    
    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: [.init()],
                pinnedViews: [.sectionHeaders]
            ) {
                ForEach(viewModel.data) { section in
                    Section(
                        header: SideDishHeader(
                            title: section.title,
                            category: section.category
                        )
                    ) {
                        ForEach(section.data, id: \.self) { sideDish in
                            SideDishRow(sideDish: sideDish)
                                .id(UUID())
                        }
                    }
                }
            }
        }
        .onAppear {
            viewModel.send(event: .appear)
        }
    }
}

struct SideDishList_Previews: PreviewProvider {
    static var previews: some View {
        SideDishList()
            .paddingStatusBar()
    }
}
