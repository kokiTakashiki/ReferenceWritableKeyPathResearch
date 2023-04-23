//
//  UIViewController+Extension.swift
//  ReferenceWritableKeyPathResearch
//
//  Created by 武田孝騎 on 2023/04/22.
//

import UIKit

extension UIViewController {
    static func makeStoryBoardToViewController() -> some UIViewController {
        let storyBoardName = String(describing: self.classForCoder())
        let storyboard = UIStoryboard(name: storyBoardName, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: storyBoardName)
        return viewController
    }
}
