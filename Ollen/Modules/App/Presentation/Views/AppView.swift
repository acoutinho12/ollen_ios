//
//  AppView.swift
//  Ollen
//
//  Created by André Luis Barbosa Coutinho on 07/01/24.
//

import Combine
import SwiftUI

struct AppView: View {
    var body: some View {
        TabView {
            Text("Hello")
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            Text("Hello")
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                }
            Text("Hello")
                .tabItem {
                    Label("Setting", systemImage: "gear")
                }
        }
    }
}

#Preview {
    AppView()
}
