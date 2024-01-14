//
//  OllenEndpoints.swift
//  Ollen
//
//  Created by André Luis Barbosa Coutinho on 14/01/24.
//

import Foundation

final class OllenEndpoints: Endpoint {
    var path: String

    var method: RequestMethod

    var header: [String : String]?

    var body: [String : String]?

    init(path: String, method: RequestMethod, header: [String : String]? = nil, body: [String : String]? = nil) {
        self.path = path
        self.method = method
        self.header = header
        self.body = body
    }

    static let beers = OllenEndpoints(path: "/v2/beers", method: .get)
}
