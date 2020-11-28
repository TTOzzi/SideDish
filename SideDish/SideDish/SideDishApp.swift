//
//  SideDishApp.swift
//  SideDish
//
//  Created by TTOzzi on 2020/11/28.
//

import SwiftUI

@main
struct SideDishApp: App {
    var body: some Scene {
        WindowGroup {
            VStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .ignoresSafeArea(.all, edges: .top)
                    .frame(height: 0)
                SideDishList()
            }
        }
    }
}
