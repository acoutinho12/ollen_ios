//
//  ViewModel.swift
//  Ollen
//
//  Created by André Luis Barbosa Coutinho on 13/01/24.
//

import Combine
import Foundation

enum ViewModelState {
    case loading, success, failure
}

protocol ViewModel: ObservableObject {
    var state: ViewModelState { get set }
}
