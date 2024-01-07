//
//  Datasource.swift
//  Ollen
//
//  Created by André Luis Barbosa Coutinho on 07/01/24.
//

import Foundation

protocol Datasource {
    var client: HttpClient { get }
}
