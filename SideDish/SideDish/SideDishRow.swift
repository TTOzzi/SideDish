//
//  SideDishRow.swift
//  SideDish
//
//  Created by TTOzzi on 2020/11/28.
//

import SwiftUI

struct SideDishRow: View {
    let sideDish: SideDish
    
    var body: some View {
        HStack {
            Image(sideDish.image)
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .frame(width: 100)
                .clipShape(Circle())
                .padding(.horizontal)
            
            VStack(alignment: .leading) {
                Text(sideDish.title)
                    .font(.rowTitle)
                    .lineLimit(1)
                
                Text(sideDish.description)
                    .subtitle()
                    .lineLimit(1)
                
                HStack {
                    if let normalPrice = sideDish.normalPrice {
                        Text(normalPrice)
                            .strikethrough()
                            .subtitle()
                    }
                        
                    Text(sideDish.salePrice)
                        .foregroundColor(.keyColor)
                        .font(.rowTitle)
                }
                
                HStack {
                    ForEach(sideDish.badge, id: \.self) { badge in
                        Badge(title: badge, textColor: .white, backgroundColor: .purple)
                    }
                }
            }
            
            Spacer()
        }
        .padding(.vertical)
    }
}

struct SideDishRow_Previews: PreviewProvider {
    static var previews: some View {
        SideDishRow(sideDish: SideDish.mockData[0])
    }
}
