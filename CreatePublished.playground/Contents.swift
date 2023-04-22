@propertyWrapper
struct Published<Value> {
    var projectedValue: Published { self }
    var wrappedValue: Value { didSet { valueDidChange() } }
    
    private var observations = MutableReference(
        value: List<(Value) -> Void>()
    )

    init(wrappedValue: Value) {
        self.wrappedValue = wrappedValue
    }
}

private extension Published {
    func valueDidChange() {
        for closure in observations.value {
            closure(wrappedValue)
        }
    }
}

class Cancellable {
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

extension Published {
    func observe(with closure: @escaping (Value) -> Void) -> Cancellable {
        // To further mimmic Combine's behaviors, we'll call
        // each observation closure as soon as it's attached to
        // our property:
        closure(wrappedValue)

        let node = observations.value.append(closure)

        return Cancellable { [weak observations] in
            observations?.value.remove(node)
        }
    }
}

@Published var text = "test"

print(text)
