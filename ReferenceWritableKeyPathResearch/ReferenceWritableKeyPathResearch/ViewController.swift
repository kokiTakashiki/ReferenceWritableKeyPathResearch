//
//  ViewController.swift
//  ReferenceWritableKeyPathResearch
//
//  Created by 武田孝騎 on 2023/04/22.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func transitSecond(_ sender: Any) {
        let viewController = SecondViewController.makeStoryBoardToUIViewController()
        self.present(viewController, animated: true)
    }
    
    @IBAction func transitThird(_ sender: Any) {
        let viewController = ThirdViewController.makeStoryBoardToUIViewController()
        self.present(viewController, animated: true)
    }

    @IBAction func transitForth(_ sender: Any) {
        let viewController = ForthViewController.makeStoryBoardToUIViewController()
        self.present(viewController, animated: true)
    }
    
    @IBAction func transitFifth(_ sender: Any) {
        let viewController = FifthViewController.makeStoryBoardToUIViewController()
        self.present(viewController, animated: true)
    }
    
    @IBAction func transitSixth(_ sender: Any) {
        let viewController = SixthViewController()
        self.present(viewController, animated: true)
    }
}

