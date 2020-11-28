//
//  SideDishList.swift
//  SideDish
//
//  Created by TTOzzi on 2020/11/28.
//

import SwiftUI

struct SideDishList: View {
    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: [.init()],
                pinnedViews: [.sectionHeaders]
            ) {
                ForEach(0..<3) { _ in
                    Section(
                        header: SideDishHeader(
                            title: "언제 먹어도 든든한 밑반찬",
                            category: "밑반찬"
                        )
                    ) {
                        ForEach(SideDish.mockData) { sideDish in
                            SideDishRow(sideDish: sideDish)
                                .id(UUID())
                        }
                    }
                }
            }
        }
    }
}

struct SideDishList_Previews: PreviewProvider {
    static var previews: some View {
        SideDishList()
    }
}
