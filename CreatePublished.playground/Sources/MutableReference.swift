import Foundation

class Reference<Value> {
    fileprivate(set) var value: Value

    init(value: Value) {
        self.value = value
    }
}

class MutableReference<Value>: Reference<Value> {
    func update(with value: Value) {
        self.value = value
    }
}
