//
//  Published.swift
//  ReferenceWritableKeyPathResearch
//
//  Created by 武田孝騎 on 2023/04/22.
//

import Foundation

@propertyWrapper
struct MyPublished<Value> {
    var projectedValue: MyPublished { self }
    var wrappedValue: Value { didSet { valueDidChange() } }
    
    private var observations = MutableReference(
        value: List<(Value) -> Void>()
    )

    init(wrappedValue: Value) {
        self.wrappedValue = wrappedValue
    }
}

private extension MyPublished {
    func valueDidChange() {
        for closure in observations.value {
            closure(wrappedValue)
        }
    }
}

class MyCancellable {
    private var closure: (() -> Void)?

    init(closure: @escaping () -> Void) {
        self.closure = closure
    }

    deinit {
        cancel()
    }

    func cancel() {
        closure?()
        closure = nil
    }
}

extension MyPublished {
    func observe(with closure: @escaping (Value) -> Void) -> MyCancellable {
        // To further mimmic Combine's behaviors, we'll call
        // each observation closure as soon as it's attached to
        // our property:
        closure(wrappedValue)

        let node = observations.value.append(closure)

        return MyCancellable { [weak observations] in
            observations?.value.remove(node)
        }
    }
}
