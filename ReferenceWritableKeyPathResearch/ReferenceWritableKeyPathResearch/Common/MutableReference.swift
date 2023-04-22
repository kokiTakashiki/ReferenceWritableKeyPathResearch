//
//  MutableReference.swift
//  ReferenceWritableKeyPathResearch
//
//  Created by 武田孝騎 on 2023/04/22.
//

import Foundation

class Reference<Value> {
    var value: Value

    init(value: Value) {
        self.value = value
    }
}

class MutableReference<Value>: Reference<Value> {
    func update(with value: Value) {
        self.value = value
    }
}

