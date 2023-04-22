//
//  ForthViewController.swift
//  NavigationAndStatusBar
//
//  Created by 武田孝騎 on 2023/04/15.
//

import UIKit

class ForthViewController: UIViewController {
    
    private let object = ForthTestObject()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let keyPath = \ForthTestObject.text
        print(keyPath)
    }
    
    deinit {
        print("call deinit‼️")
    }
}
