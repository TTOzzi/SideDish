//
//  SideDishUseCase.swift
//  SideDish
//
//  Created by TTOzzi on 2020/11/28.
//

import Combine
import Foundation

protocol SideDishUseCaseType {
    func load(endPoint: EndPoint) -> AnyPublisher<SideDishSection, Never>
}

struct SideDishSection: Identifiable {
    let id = UUID()
    let category: String
    let title: String
    let data: [SideDish]
}

struct SideDishUseCase: SideDishUseCaseType {
    private let networkService: NetworkServiceType
    
    init(networkService: NetworkServiceType) {
        self.networkService = networkService
    }
    
    func load(endPoint: EndPoint) -> AnyPublisher<SideDishSection, Never> {
        return networkService
            .request(with: endPoint)
            .decode(type: SideDishResponse.self, decoder: JSONDecoder())
            .map {
                SideDishSection(category: endPoint.path.category,
                                title: endPoint.path.title,
                                data: $0.body)
            }
            .replaceError(with: SideDishSection(category: "", title: "", data: []))
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
