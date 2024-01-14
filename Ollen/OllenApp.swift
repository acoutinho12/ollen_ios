//
//  OllenApp.swift
//  Ollen
//
//  Created by André Luis Barbosa Coutinho on 06/01/24.
//

import SwiftUI

@main
struct OllenApp: App {
    @StateObject var appCoordinator = AppCoordinator()
    var body: some Scene {
        WindowGroup {
            appCoordinator.build()
        }.environmentObject(appCoordinator)
    }
}
