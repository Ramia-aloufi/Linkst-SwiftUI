//
//  StateUtils.swift
//  Linkst
//
//  Created by ramia n on 27/03/1447 AH.
//

import Foundation

public enum AppState<T>{
    case idle
    case loading
    case data(T)
    case error(String)
    case empty
}


extension AppState {
    var isLoading: Bool {
        if case .loading = self { return true }
        return false
    }

    var value: T? {
        if case .data(let data) = self { return data }
        return nil
    }

    var errorMessage: String? {
        if case .error(let error) = self { return error }
        return nil
    }
}
