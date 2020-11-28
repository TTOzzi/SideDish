//
//  SideDishViewModel.swift
//  SideDish
//
//  Created by TTOzzi on 2020/11/28.
//

import Combine

final class SideDishViewModel: ObservableObject {
    enum Input {
        case appear
    }
    
    enum State {
        case idle
        case loading(data: [SideDishCategory])
        case loaded(data: [SideDishCategory])
        case error(message: String)
    }
    
    private var loadSubscription: AnyCancellable?
    private let useCase: SideDishUseCaseType
    private var data = [SideDishCategory]()
    @Published private(set) var state = State.idle
    
    init(useCase: SideDishUseCaseType = SideDishUseCase()) {
        self.useCase = useCase
    }
    
    func send(event: Input) {
        switch event {
        case .appear:
            load()
        }
    }
    
    private func load() {
        loadSubscription = [
            useCase.load(endPoint: .init(path: .main)),
            useCase.load(endPoint: .init(path: .soup)),
            useCase.load(endPoint: .init(path: .side))
        ]
        .publisher
        .flatMap(maxPublishers: .max(1)) { $0 }
        .sink(receiveCompletion: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .finished:
                self.state = .loaded(data: self.data)
            case let .failure(error):
                self.state = .error(message: error.localizedDescription)
            }
        }, receiveValue: { [weak self] in
            guard let self = self else { return }
            self.data.append($0)
            self.state = .loading(data: self.data)
        })
    }
}
