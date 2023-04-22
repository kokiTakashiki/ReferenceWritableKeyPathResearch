//
//  SecondViewController.swift
//  NavigationAndStatusBar
//
//  Created by 武田孝騎 on 2023/04/14.
//

import UIKit
import Combine

class SecondViewController: UIViewController {
    
    @IBOutlet private weak var testLabel: UILabel!
    
    private let object = SecondTestObject()
    private var cancels = Set<AnyCancellable>()

    override func viewDidLoad() {
        self.object.$text.sink { [weak self] value in
            self?.testLabel.text = value
        }
        .store(in: &cancels)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // wrappedValueに値を代入するとReferenceWritableKeyPathが生成され、deinitしてもそのReferenceWritableKeyPathは残る。
        //self.object.text = "test test"
        // assign(to:)を利用することでReferenceWritableKeyPathを生成せずに値を変更できる。
        Just("test test").assign(to: &self.object.$text)
    }

    deinit {
        print("call deinit‼️")
    }
}
