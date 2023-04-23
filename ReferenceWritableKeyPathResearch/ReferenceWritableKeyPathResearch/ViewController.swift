//
//  ViewController.swift
//  ReferenceWritableKeyPathResearch
//
//  Created by 武田孝騎 on 2023/04/22.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func transitSecond(_ sender: Any) {
        let viewController = SecondViewController.makeStoryBoardToViewController()
        self.present(viewController, animated: true)
    }
    
    @IBAction func transitThird(_ sender: Any) {
        let viewController = ThirdViewController.makeStoryBoardToViewController()
        self.present(viewController, animated: true)
    }

    @IBAction func transitForth(_ sender: Any) {
        let viewController = ForthViewController.makeStoryBoardToViewController()
        self.present(viewController, animated: true)
    }
    
    @IBAction func transitFifth(_ sender: Any) {
        let viewController = FifthViewController.makeStoryBoardToViewController()
        self.present(viewController, animated: true)
    }
    
    @IBAction func transitSixth(_ sender: Any) {
        let viewController = SixthViewController()
        self.present(viewController, animated: true)
    }
}

