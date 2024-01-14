//
//  ProductRepositoryImpl.swift
//  Ollen
//
//  Created by André Luis Barbosa Coutinho on 14/01/24.
//

import Foundation

final class ProductRepositoryImpl: ProductRepository {
    var datasource: Datasource

    init(datasource: ProductDatasource) {
        self.datasource = datasource
    }

    private var productDatasource: ProductDatasource {
        datasource as? ProductDatasource ?? ProductDatasourceImpl()
    }

    func getBeers() async -> Result<Beers, Error> {
        await productDatasource.getBeers()
    }
}
