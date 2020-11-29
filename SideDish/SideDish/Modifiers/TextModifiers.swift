//
//  TextModifiers.swift
//  SideDish
//
//  Created by TTOzzi on 2020/11/28.
//

import SwiftUI

struct Subtitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.secondary)
            .font(.system(size: 12))
    }
}

extension Text {
    func subtitle() -> some View {
        modifier(Subtitle())
    }
}
