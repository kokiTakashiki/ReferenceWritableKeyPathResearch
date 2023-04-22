//
//  ThirdTestObject.swift
//  NavigationAndStatusBar
//
//  Created by 武田孝騎 on 2023/04/14.
//

import Foundation

class ThirdTestObject {
    @ForcedUpperCase var text = "test✅"
}

@propertyWrapper
struct ForcedUpperCase {
    private var string: String = ""
    private var bool = false
    var wrappedValue: String {
        get { return string }
        set {
            let upperCased = newValue.uppercased()
            // 変換されたことを監視するため代入された値と変換後の値が異なる場合はtrueを代入する。
            projectedValue = string != upperCased
            string = newValue.uppercased()
        }
    }
    var projectedValue: Bool {
        get {
            bool
        }
        set {
            self.bool = newValue
        }
    }
    init(wrappedValue: String) {
        self.string = wrappedValue
    }
    init(wrappedValue: String, projectedValue: Bool) {
        self.string = wrappedValue
        self.bool = projectedValue
    }
    
}
