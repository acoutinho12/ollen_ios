//
//  HomeView.swift
//  Ollen
//
//  Created by André Luis Barbosa Coutinho on 07/01/24.
//

import Combine
import SwiftUI

struct HomeView: View {

    let columns = [GridItem(.flexible()),
                   GridItem(.flexible())]

    @StateObject var viewModel: HomeViewModel

    let didClickProduct = PassthroughSubject<Beer, Never>()

    private func fetchProducts() async {
        await viewModel.fetchUsers()
    }

    var body: some View {
        ScrollView {
            Group {
                if viewModel.state == .loading {
                    LoadingView()
                } else {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(viewModel.beers, id: \.id) { beer in

                            ProductCardComponent(beer: beer)
                                .onTapGesture {
                                    didClickProduct.send(beer)
                                }
                        }
                    }
                    .padding(.horizontal)
                }

            }

        }.task {
            await fetchProducts()
        }.refreshable {
            await fetchProducts()
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel(getBeersUseCase: GetBeersUseCase(repository: ProductRepositoryImpl(datasource: ProductDatasourceImpl()))))
}
