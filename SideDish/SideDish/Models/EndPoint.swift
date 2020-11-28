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
    }
    
    private let baseURL = "https://h3rb9c0ugl.execute-api.ap-northeast-2.amazonaws.com/develop/baminchan"
    let path: Path
    var request: URLRequest? {
        guard let url = URL(string: baseURL + path.description) else { return nil }
        return URLRequest(url: url)
    }
}
