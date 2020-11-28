//
//  SideDishRow.swift
//  SideDish
//
//  Created by TTOzzi on 2020/11/28.
//

import SwiftUI

struct SideDishRow: View {
    var body: some View {
        HStack {
            Image("dish")
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .frame(width: 100)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text("[미노리키친] 규동 250g")
                    .font(.rowTitle)
                    .lineLimit(1)
                
                Text("일본인의 소울푸드! 한국인도 좋아하는 소고기덮밥")
                    .subtitle()
                    .lineLimit(1)
                
                HStack {
                    Text("7,500")
                        .strikethrough()
                        .subtitle()
                        
                    Text("7,100원")
                        .foregroundColor(.keyColor)
                        .font(.rowTitle)
                }
                
                HStack {
                    Badge(title: "론칭 특가", textColor: .white, backgroundColor: .purple)
                    
                    Badge(title: "이벤트 특가", textColor: .white, backgroundColor: .purple)
                }
            }
            
            Spacer()
        }
    }
}

struct SideDishRow_Previews: PreviewProvider {
    static var previews: some View {
        SideDishRow()
    }
}
