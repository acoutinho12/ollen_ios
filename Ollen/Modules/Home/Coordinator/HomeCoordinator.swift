//
//  HomeCoordinator.swift
//  Ollen
//
//  Created by André Luis Barbosa Coutinho on 14/01/24.
//

import Combine
import Foundation
import SwiftUI

// Enum to identify Home screen Types
enum HomePage: String, Identifiable {
    case home, productDetail

    var id: String {
        rawValue
    }
}

class HomeCoordinator: StackCoordinator {
    var id = UUID()

    @Published var path: NavigationPath

    var bag = Set<AnyCancellable>()

    private var beer: Beer?

    func push<T>(_ page: T) where T: Hashable {
        path.append(page)
    }

    init(path: NavigationPath) {
        self.path = path
    }

    @ViewBuilder
    func build(page: HomePage = .home) -> some View {
        switch page {
        case .home:
            buildHome()
        case .productDetail:
            buildProductDetail()
        }
    }

    // MARK: Views Bindings

    private func bind(view: HomeView) {
        view.didClickProduct
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] beer in
                self?.beer = beer
                self?.push(HomePage.productDetail)
            })
            .store(in: &bag)
    }

    // MARK: Build Views

    private func buildHome() -> HomeView {
        let getBeersUseCase = GetBeersUseCase(repository: ProductRepositoryImpl(datasource: ProductDatasourceImpl()))
        let viewModel = HomeViewModel(getBeersUseCase: getBeersUseCase)
        let home = HomeView(viewModel: viewModel)
        bind(view: home)
        return home
    }

    private func buildProductDetail() -> ProductDetailView {
        let productDetailView = ProductDetailView()
        return productDetailView
    }

}
