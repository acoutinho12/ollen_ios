//
//  UseCase.swift
//  Ollen
//
//  Created by André Luis Barbosa Coutinho on 07/01/24.
//

import Foundation

protocol UseCase {
    var repository: Repository { get }
    func execute<ResultType: Codable, Params>(params: Params) async -> Result<ResultType, Error>
}
