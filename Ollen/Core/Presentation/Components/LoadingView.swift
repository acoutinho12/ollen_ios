//
//  LoadingView.swift
//  Ollen
//
//  Created by André Luis Barbosa Coutinho on 14/01/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            Spacer(minLength: 0)
            ProgressView()
            Spacer(minLength: 0)
        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    }
}

#Preview {
    LoadingView()
}
