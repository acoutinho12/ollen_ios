//
//  ProductRepository.swift
//  Ollen
//
//  Created by André Luis Barbosa Coutinho on 14/01/24.
//

import Foundation

protocol ProductRepository: Repository {
    func getBeers() async -> Result<Beers, Error>
}
