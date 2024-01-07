//
//  OllenClient.swift
//  Ollen
//
//  Created by André Luis Barbosa Coutinho on 07/01/24.
//

import Foundation

final class OllenClient: HttpClient {
    var scheme: String {
        "https"
    }

    var host: String {
        Urls.ollenBaseURL
    }

    static let shared = OllenClient()
    private init () {}
}
