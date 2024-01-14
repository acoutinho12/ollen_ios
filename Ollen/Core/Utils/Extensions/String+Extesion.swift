//
//  String+Extesion.swift
//  Ollen
//
//  Created by admin on 14/01/24.
//

import Foundation

extension String {
    var toUrl: URL? {
        URL(string: self)
    }
}
