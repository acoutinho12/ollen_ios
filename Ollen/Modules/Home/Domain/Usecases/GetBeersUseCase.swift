//
//  GetBeersUseCase.swift
//  Ollen
//
//  Created by admin on 14/01/24.
//

import Foundation

class GetBeersUseCase: UseCase {
    typealias ResultType = Beers

    typealias Params = NoParams?

    var repository: Repository

    private var productRepository: ProductRepository {
        guard let repo = repository as? ProductRepository else {
            return ProductRepositoryImpl(datasource: ProductDatasourceImpl())
        }
        return repo
    }

    init(repository: ProductRepository) {
        self.repository = repository
    }

    func execute(params _: Params = NoParams()) async -> Result<ResultType, Error> {
        await productRepository.getBeers()
    }
}
