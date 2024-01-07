//
//  HttpClient.swift
//  Ollen
//
//  Created by André Luis Barbosa Coutinho on 07/01/24.
//

import Foundation

protocol HttpClient {
    func sendRequest<T: Decodable>(endpoint: Endpoint, responseModel: T.Type) async -> Result<T, Error>
    var scheme: String { get }
    var host: String { get }
}

extension HttpClient {
    func sendRequest<T: Decodable>(endpoint: Endpoint,
                                   responseModel: T.Type) async -> Result<T, Error> {
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = host
        urlComponents.path = endpoint.path

        guard let url = urlComponents.url else {
            return .failure(ErrorUtils.invalidURL)
        }

        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.header

        if let body = endpoint.body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        }

        do {
            let (data, response) = try await URLSession.shared.data(for: request, delegate: nil)
            guard let response = response as? HTTPURLResponse else {
                return .failure(ErrorUtils.noResponse)
            }
            switch response.statusCode {
            case 200...299:
                guard let decodedResponse = try? JSONDecoder().decode(responseModel, from: data) else {
                    return .failure(ErrorUtils.decode)
                }
                return .success(decodedResponse)
            case 401:
                return .failure(ErrorUtils.unauthorized)
            case 403:
                return .failure(ErrorUtils.forbidden)
            case 404:
                return .failure(ErrorUtils.notFound)
            default:
                return .failure(ErrorUtils.serverError)
            }
        } catch {
            return .failure(ErrorUtils.unknown)
        }
    }
}
