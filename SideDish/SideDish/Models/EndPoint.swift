//
//  EndPoint.swift
//  SideDish
//
//  Created by TTOzzi on 2020/11/28.
//

import Foundation

struct EndPoint: RequestProviding {
    enum Path: CustomStringConvertible {
        case main
        case soup
        case side
        
        var description: String {
            switch self {
            case .main:
                return "/main"
            case .soup:
                return "/soup"
            case .side:
                return "/side"
            }
        }
        
        var category: String {
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
    
    private let baseURL = "https://h3rb9c0ugl.execute-api.ap-northeast-2.amazonaws.com/develop/baminchan"
    let path: Path
    var request: URLRequest? {
        guard let url = URL(string: baseURL + path.description) else { return nil }
        return URLRequest(url: url)
    }
}
