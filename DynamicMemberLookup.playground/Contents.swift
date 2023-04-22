enum ColorTheme {
    case modern
    case oldSchool
}

//@dynamicMemberLookup
struct Settings {
    var colorTheme = ColorTheme.modern
    var itemPageSize = 25
    var keepUserLoggedIn = true

//    subscript(dynamicMember member: String) -> Any? {
//        switch member {
//        case "colorTheme":
//            return colorTheme
//        case "itemPageSize":
//            return itemPageSize
//        case "keepUserLoggedIn":
//            return keepUserLoggedIn
//        default:
//            return nil
//        }
//    }
}

//let setting = Settings()
//let theme1 = setting.colorTheme
//setting.colorTheme = .oldSchool

@dynamicMemberLookup
class Reference<Value> {
    private(set) var value: Value

    init(value: Value) {
        self.value = value
    }

    subscript<T>(dynamicMember keyPath: KeyPath<Value, T>) -> T {
        value[keyPath: keyPath]
    }
}

let reference = Reference(value: Settings())
let theme = reference.colorTheme

extension Reference {
    subscript<T>(dynamicMember keyPath: WritableKeyPath<Value, T>) -> T {
        get { value[keyPath: keyPath] }
        set { value[keyPath: keyPath] = newValue }
    }
}

let reference2 = Reference(value: Settings())
reference2.colorTheme = .oldSchool
