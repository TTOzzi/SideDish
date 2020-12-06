//
//  File.swift
//  SideDish
//
//  Created by TTOzzi on 2020/12/06.
//

import Combine
import Foundation
import class UIKit.UIImage

private struct ImageRequest: RequestProviding {
    let urlString: String
    
    var request: URLRequest? {
        guard let url = URL(string: urlString) else { return nil }
        return URLRequest(url: url)
    }
}

final class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    private let networkService: NetworkServiceType
    private let urlString: String
    private var cancellable: AnyCancellable?
    
    init(networkService: NetworkServiceType = NetworkService(),
         urlString: String) {
        self.networkService = networkService
        self.urlString = urlString
    }
    
    deinit {
        cancel()
    }
    
    func load() {
        cancellable = networkService.request(with: ImageRequest(urlString: urlString))
            .map { UIImage(data: $0) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in self?.image = $0 }
    }
    
    func cancel() {
        cancellable?.cancel()
    }
}
