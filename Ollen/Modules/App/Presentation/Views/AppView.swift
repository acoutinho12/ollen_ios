//
//  AppView.swift
//  Ollen
//
//  Created by André Luis Barbosa Coutinho on 07/01/24.
//

import Combine
import SwiftUI

struct AppView: View {
    @StateObject var homeCoordinator = HomeCoordinator(path: NavigationPath())
    var body: some View {
        TabView {
            NavigationStack(path: $homeCoordinator.path, root: {
                homeCoordinator.build()
                    .navigationDestination(for: HomePage.self) { page in
                        homeCoordinator.build(page: page)
                    }
            })
            .tabItem {
                Label("Home", systemImage: "house.fill")
            }
            FavoriteView()
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                }
            Text("Hello")
                .tabItem {
                    Label("Setting", systemImage: "gear")
                }
        }.environmentObject(homeCoordinator)
    }
}

#Preview {
    AppView()
}
