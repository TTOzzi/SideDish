//
//  SideDishUseCase.swift
//  SideDish
//
//  Created by TTOzzi on 2020/11/28.
//

import Combine
import Foundation

enum UseCaseError: Error {
    case decodeError
    case networkError(message: String)
}

protocol SideDishUseCaseType {
    func load(category: SideDishUseCase.Category) -> AnyPublisher<SideDishCategory, UseCaseError>
}

struct SideDishCategory: Identifiable {
    let id = UUID()
    let keyword: String
    let title: String
    let data: [SideDish]
}

struct SideDishUseCase: SideDishUseCaseType {
    enum Category {
        case main
        case soup
        case side
        
        var keyword: String {
            switch self {
            case .main:
                return "메인요리"
            case .soup:
                return "국•찌개"
            case .side:
                return "밑반찬"
            }
        }
        
        var title: String {
            switch self {
            case .main:
                return "한그릇 뚝딱 메인 요리"
            case .soup:
                return "김이 모락모락 국, 찌개"
            case .side:
                return "언제 먹어도 든든한 밑반찬"
            }
        }
    }
    
    private let networkService: NetworkServiceType
    
    init(networkService: NetworkServiceType = NetworkService()) {
        self.networkService = networkService
    }
    
    func load(category: Category) -> AnyPublisher<SideDishCategory, UseCaseError> {
        return networkService
            .request(with: endPoint(for: category))
            .decode(type: SideDishResponse.self, decoder: JSONDecoder())
            .map {
                SideDishCategory(keyword: category.keyword,
                                title: category.title,
                                data: $0.body)
            }
            .mapError{ error -> UseCaseError in
                if let networkError = error as? NetworkError {
                    return .networkError(message: networkError.localizedDescription)
                }
                
                return .decodeError
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    private func endPoint(for category: Category) -> EndPoint {
        switch category {
        case .main:
            return EndPoint(path: .main)
        case .soup:
            return EndPoint(path: .soup)
        case .side:
            return EndPoint(path: .side)
        }
    }
}
