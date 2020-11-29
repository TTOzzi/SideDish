//
//  UseCaseError.swift
//  SideDish
//
//  Created by TTOzzi on 2020/11/29.
//

import Foundation

enum UseCaseError: Error {
    case decodeError
    case networkError(message: String)
}
