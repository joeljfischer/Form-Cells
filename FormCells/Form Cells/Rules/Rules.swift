//
//  Rules.swift
//  Ding-Timer
//
//  Created by Joel Fischer on 2/11/19.
//  Copyright © 2019 Joel Fischer. All rights reserved.
//

import Foundation

protocol Verifiable {
    associatedtype DataType
    var data: DataType? { get set }
    var rules: [Rule<Any>] { get set }

    func verify() -> Bool
}
extension Verifiable {
    func verify(data: DataType) -> Bool {
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

class Rule<DataType> {
    func verify(data: DataType?) -> Bool { return false }
}

class RuleRequired: Rule<Any> {
    override func verify(data: Any?) -> Bool {
        return data != nil
    }
}

class RuleNonEmpty: Rule<String> {
    override func verify(data: String?) -> Bool {
        guard let data = data else { return false }
        return !data.isEmpty
    }
}

class RuleNonZero: Rule<TimeInterval> {
    override func verify(data: TimeInterval?) -> Bool {
        guard let data = data else { return false }
        return !data.isZero
    }
}
