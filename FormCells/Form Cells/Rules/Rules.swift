//
//  Rules.swift
//  Ding-Timer
//
//  Created by Joel Fischer on 2/11/19.
//  Copyright © 2019 Joel Fischer. All rights reserved.
//

import Foundation

protocol Verifiable {
    var data: String? { get set }
    var rules: [Rule] { get set }

    func verify() -> Bool
}
extension Verifiable {
    func verify() -> Bool {
        for rule in rules {
            if rule.verify(data: data) {
                continue
            } else {
                return false
            }
        }

        return true
    }
}

protocol Rule {
    func verify(data: String?) -> Bool
}

protocol RuleRequired: Rule {}
extension RuleRequired {
    func verify(data: String?) -> Bool {
        guard let data = data else { return false }
        return !data.isEmpty
    }
}
