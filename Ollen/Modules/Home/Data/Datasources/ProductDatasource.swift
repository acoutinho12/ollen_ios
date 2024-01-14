//
//  ProductDatasource.swift
//  Ollen
//
//  Created by André Luis Barbosa Coutinho on 14/01/24.
//

import Foundation

protocol ProductDatasource: Datasource {
    func getBeers() async -> Result<Beers, Error>

}

final class ProductDatasourceImpl: ProductDatasource {
    var client: HttpClient = OllenClient.shared

    func getBeers() async -> Result<Beers, Error> {
        let beers = await client.sendRequest(endpoint: OllenEndpoints.beers, responseModel: Beers.self)
        return beers
    }
}

