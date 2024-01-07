//
//  ContentView.swift
//  Ollen
//
//  Created by André Luis Barbosa Coutinho on 06/01/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var appCoordinator = AppCoordinator(path: NavigationPath())

    var body: some View {
        NavigationStack(path: $appCoordinator.path) {
            appCoordinator.build()
//                          .navigationDestination(for: UserFlowCoordinator.self) { coordinator in
//                              coordinator.build()
//                          }
//                          .navigationDestination(for: SettingsFlowCoordinator.self) { coordinator in
//                              coordinator.build()
//                          }
//                          .navigationDestination(for: ProfileFlowCoordinator.self) { coordinator in
//                              coordinator.build()
//                          }
        }
        .environmentObject(appCoordinator)
    }
}

#Preview {
    ContentView()
}
