//
//  MockRequest.swift
//  SideDishTests
//
//  Created by TTOzzi on 2020/11/29.
//

import Foundation
@testable import SideDish

struct MockSuccessRequest: RequestProviding {
    var request: URLRequest? = URLRequest(url: URL(string: "https://h3rb9c0ugl.execute-api.ap-northeast-2.amazonaws.com/develop/baminchan/main")!)
}

struct MockFailureRequest: RequestProviding {
    var request: URLRequest? = URLRequest(url: URL(string: "test")!)
}
