//
//  Coordinator.swift
//  Ollen
//
//  Created by André Luis Barbosa Coutinho on 14/01/24.
//

import Combine
import Foundation
import SwiftUI

protocol Coordinator: ObservableObject, Hashable {
    var id: UUID { get }
    var bag: Set<AnyCancellable> { get }
}

protocol StackCoordinator: Coordinator {
    var path: NavigationPath { get }
    func push<T>(_ page: T) where T : Hashable
}

extension Coordinator {
    // MARK: Required methods for class to conform to Hashable

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
}
