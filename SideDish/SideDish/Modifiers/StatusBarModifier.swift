//
//  StatusBarModifier.swift
//  SideDish
//
//  Created by TTOzzi on 2020/11/28.
//

import SwiftUI

struct StatusBarPadding: ViewModifier {
    func body(content: Content) -> some View {
        VStack {
            Rectangle()
                .foregroundColor(.clear)
                .ignoresSafeArea(.all, edges: .top)
                .frame(height: 0)
            content
        }
    }
}
extension View {
    func paddingStatusBar() -> some View {
        modifier(StatusBarPadding())
    }
}
