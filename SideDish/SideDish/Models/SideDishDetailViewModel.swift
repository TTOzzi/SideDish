//
//  SideDishDetailViewModel.swift
//  SideDish
//
//  Created by TTOzzi on 2020/11/29.
//

import Foundation
import Combine

final class SideDishDetailViewModel: ObservableObject {
    enum Input {
        case appear
    }
    
    enum State {
        case idle
        case loaded(title: String, data: SideDishInfo)
        case error(message: String)
    }
    
    private var subscription: AnyCancellable?
    private let title: String
    private let detailHash: String
    private let useCase: SideDishDetailUseCaseType
    @Published private(set) var state = State.idle
    
    init(sideDish: SideDish, useCase: SideDishDetailUseCaseType = SideDishDetailUseCase()) {
        title = sideDish.title
        detailHash = sideDish.detailHash
        self.useCase = useCase
    }
    
    func send(event: Input) {
        switch event {
        case .appear:
            load()
        }
    }
    
    private func load() {
        subscription = useCase.load(detailHash: detailHash)
            .sink(receiveCompletion: { [weak self] result in
                guard case let .failure(error) = result else { return }
                self?.state = .error(message: error.localizedDescription)
            },
            receiveValue: { [weak self] data in
                guard let self = self else { return }
                self.state = .loaded(title: self.title, data: data)
            })
    }
}
