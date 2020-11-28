//
//  SideDishListViewModel.swift
//  SideDish
//
//  Created by TTOzzi on 2020/11/28.
//

import Combine

final class SideDishListViewModel: ObservableObject {
    enum Input {
        case appear
    }
    
    private var loadSubscription: AnyCancellable?
    private let useCase: SideDishUseCaseType
    @Published private(set) var data = [SideDishSection]()
    
    init(useCase: SideDishUseCaseType) {
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
        .sink { [weak self] in
            self?.data.append($0)
        }
    }
}
