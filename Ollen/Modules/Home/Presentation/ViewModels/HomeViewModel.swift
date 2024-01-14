//
//  HomeViewModel.swift
//  Ollen
//
//  Created by André Luis Barbosa Coutinho on 13/01/24.
//

import Combine
import Foundation

final class HomeViewModel: ViewModel {
    @Published var state: ViewModelState = .loading

    @Published var beers: Beers = []

    let getBeersUseCase: GetBeersUseCase

    init(getBeersUseCase: GetBeersUseCase) {
        self.getBeersUseCase = getBeersUseCase
    }

    @MainActor
    func fetchUsers() async {
        state = .loading
        let beersResult = await getBeersUseCase.execute()
        switch beersResult {
        case let .success(resultBeers):
            state = .success
            beers = resultBeers
        case .failure:
            state = .failure
        }
    }
}
