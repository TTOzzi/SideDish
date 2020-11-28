//
//  SideDishList.swift
//  SideDish
//
//  Created by TTOzzi on 2020/11/29.
//

import SwiftUI

struct SideDishList: View {
    let data: [SideDishCategory]
    
    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: [.init()],
                pinnedViews: [.sectionHeaders]
            ) {
                ForEach(data) { sectionData in
                    section(of: sectionData)
                }
            }
        }
    }
    
    private func section(of category: SideDishCategory) -> some View {
        return Section(
            header: SideDishHeader(
                title: category.title,
                category: category.keyword
            )
        ) {
            ForEach(category.data, id: \.self) { sideDish in
                SideDishRow(sideDish: sideDish)
                    .id(UUID())
            }
        }
    }
}


struct SideDishList_Previews: PreviewProvider {
    static var previews: some View {
        SideDishList(data: [
                        .init(keyword: "키워드",
                              title: "제목",
                              data: [.init(detailHash: "",
                                           imageURL: "",
                                           title: "",
                                           description: "",
                                           normalPrice: "",
                                           salePrice: "",
                                           badge: [])])
        ])
    }
}
