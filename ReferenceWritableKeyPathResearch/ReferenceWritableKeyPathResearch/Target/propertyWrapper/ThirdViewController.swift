//
//  ThirdViewController.swift
//  NavigationAndStatusBar
//
//  Created by 武田孝騎 on 2023/04/14.
//

import UIKit

class ThirdViewController: UIViewController {
    
    private var object = ThirdTestObject()

    override func viewDidLoad() {
        self.object.text = "test test"
        print("object.text \(object.text)")
    }

    deinit {
        print("call deinit‼️")
    }
}
