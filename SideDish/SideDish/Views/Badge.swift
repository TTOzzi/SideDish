//
//  Badge.swift
//  SideDish
//
//  Created by TTOzzi on 2020/11/28.
//

import SwiftUI

struct Badge: View {
    let title: String
    let textColor: Color
    let backgroundColor: Color
    
    var body: some View {
        Text(title)
            .foregroundColor(textColor)
            .font(.system(size: 12))
            .padding(.vertical, 2)
            .padding(.horizontal, 4)
            .background(backgroundColor)
    }
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge(title: "론칭 특가", textColor: .white, backgroundColor: .purple)
            .previewLayout(.fixed(width: 100, height: 100))
    }
}
