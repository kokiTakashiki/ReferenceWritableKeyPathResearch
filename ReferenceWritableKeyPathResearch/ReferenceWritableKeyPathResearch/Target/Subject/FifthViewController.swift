//
//  FifthViewController.swift
//  NavigationAndStatusBar
//
//  Created by 武田孝騎 on 2023/04/15.
//

import UIKit
import Combine

class FifthViewController: UIViewController {
    @IBOutlet private weak var testLabel: UILabel!
    
    private let object = FifthTestObject()
    private var cancels = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.object.text.sink { [weak self] value in
            self?.testLabel.text = value
        }
        .store(in: &cancels)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.object.text.send("tes tes")
    }
    
    deinit {
        print("call deinit‼️")
    }
}
