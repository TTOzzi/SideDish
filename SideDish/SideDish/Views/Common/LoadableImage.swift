//
//  LoadableImage.swift
//  SideDish
//
//  Created by TTOzzi on 2020/12/06.
//

import Combine
import SwiftUI

struct LoadableImage: View {
    @StateObject private var loader: ImageLoader
    
    init(urlString: String) {
        _loader = StateObject(wrappedValue: ImageLoader(urlString: urlString))
    }
    
    var body: some View {
        content
            .onAppear(perform: loader.load)
    }
    
    @ViewBuilder
    private var content: some View {
        if let image = loader.image {
            Image(uiImage: image)
                .resizable()
        } else {
            Image(systemName: "exclamationmark.circle")
                .resizable()
        }
    }
}

struct LoadableImage_Previews: PreviewProvider {
    static var previews: some View {
        LoadableImage(urlString: "")
    }
}
