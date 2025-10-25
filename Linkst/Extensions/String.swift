//
//  String.swift
//  Linkst
//
//  Created by ramia n on 26/03/1447 AH.
//

import Foundation


extension String{
    var isEmptyOrWhitespace: Bool {
        return self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
        func isValidEmail() -> Bool {
            // Simple regex validation
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
            return NSPredicate(format:"SELF MATCHES %@", emailRegEx).evaluate(with: self)
        }
    func truncated(limit: Int) -> String {
        count > limit ? String(prefix(limit)) + "..." : self
    }
}
