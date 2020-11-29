//
//  SideDishHeader.swift
//  SideDish
//
//  Created by TTOzzi on 2020/11/28.
//

import SwiftUI

struct SideDishHeader: View {
    let title: String
    let category: String
    
    var body: some View {
        HStack {
            Spacer()
            
            VStack {
                BadgeView(title: category,
                      textColor: .secondary,
                      backgroundColor: .white)
                    .border(Color.secondary, width: 1)
                
                Text(title)
                    .font(.system(size: 18, weight: .bold))
            }
            
            Spacer()
        }
        .padding(.bottom)
        .background(Color.white)
    }
}

struct SideDishHeader_Previews: PreviewProvider {
    static var previews: some View {
        SideDishHeader(title: "언제 먹어도 든든한 밑반찬",
                       category: "밑반찬")
            .previewLayout(.fixed(width: 350, height: 80))
    }
}
