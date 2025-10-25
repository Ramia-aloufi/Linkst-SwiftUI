//
//  CollectionEx.swift
//  Linkst
//
//  Created by ramia n on 27/04/1447 AH.
//

import Foundation
extension Collection {
    subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}
