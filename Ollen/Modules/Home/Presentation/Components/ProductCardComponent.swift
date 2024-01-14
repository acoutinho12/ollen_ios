//
//  ProductCardComponent.swift
//  Ollen
//
//  Created by admin on 14/01/24.
//

import SwiftUI

struct ProductCardComponent: View {
    let beer: Beer
    var body: some View {
        GeometryReader { geometry in

            let width = geometry.size.width
            let heigth = geometry.size.height * 0.1
            VStack(spacing: 8.0) {
                AsyncImage(url: beer.imageURL?.toUrl) { phase in
                    switch phase {
                    case let .success(image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)

                    default:
                        Image(systemName: "photo")
                    }
                }


                Text(beer.name ?? "").frame(height: heigth)
                Text(beer.description ?? "")
            }
        }
    }
}

#Preview {
    ProductCardComponent(beer: MockBeer.mock)
}
