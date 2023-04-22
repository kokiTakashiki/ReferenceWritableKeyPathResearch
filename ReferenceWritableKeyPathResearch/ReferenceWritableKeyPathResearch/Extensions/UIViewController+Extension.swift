//
//  UIViewController+Extension.swift
//  ReferenceWritableKeyPathResearch
//
//  Created by 武田孝騎 on 2023/04/22.
//

import UIKit

extension UIViewController {
    class func instantiateStoryBoardToViewController<T: UIViewController>() -> T {
        let storyboardName = String(describing: self.classForCoder())
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: storyboardName) as? T else {
            fatalError("fail create viewController")
        }
        return viewController
    }
}
