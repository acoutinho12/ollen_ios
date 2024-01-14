//
//  AppCoordinator.swift
//  Ollen
//
//  Created by André Luis Barbosa Coutinho on 07/01/24.
//

import Combine
import SwiftUI

final class AppCoordinator: Coordinator {
    var id = UUID()
    var bag = Set<AnyCancellable>()

    @ViewBuilder
    func build() -> some View {
        appView()
    }

    private func appView() -> some View {
        let appView = AppView()
        return appView
    }
}
