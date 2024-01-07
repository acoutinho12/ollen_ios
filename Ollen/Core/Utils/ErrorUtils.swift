//
//  ErrorUtils.swift
//  Ollen
//
//  Created by André Luis Barbosa Coutinho on 07/01/24.
//

import Foundation

enum ErrorUtils: Error {
    case decode
    case forbidden
    case noResponse
    case invalidURL
    case badRequest
    case unauthorized
    case notFound
    case serverError
    case unknown

    var message: String {
        switch self {
        case .decode:
            return "Decode error"
        case .unauthorized:
            return "Unauthorized"
        case .invalidURL:
            return "Invalid URL"
        case .notFound:
            return "Not Found"
        case .badRequest:
            return "Bad Request"
        case .forbidden:
            return "Forbidden"
        case .serverError:
            return "Server Error"
        default:
            return "Unknown error"
        }
    }
}
