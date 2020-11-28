//
//  Badge.swift
//  SideDish
//
//  Created by TTOzzi on 2020/11/28.
//

import SwiftUI

struct Badge: View {
    let title: String
    let color: Color
    
    var body: some View {
        Text(title)
            .foregroundColor(.white)
            .font(.system(size: 12))
            .padding(.vertical, 2)
            .padding(.horizontal, 4)
            .background(color)
    }
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge(title: "론칭특가", color: .purple)
            .previewLayout(.fixed(width: 100, height: 100))
    }
}
