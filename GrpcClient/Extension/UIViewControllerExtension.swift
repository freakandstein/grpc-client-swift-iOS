//
//  UIViewControllerExtension.swift
//  GrpcClient
//
//  Created by Satrio Wicaksono on 20/11/19.
//  Copyright © 2019 Satrio Wicaksono. All rights reserved.
//

import Foundation
import UIKit

enum StoryboardName: String {
    case Main = "Main"
}

extension UIViewController {
    
    func getViewController(viewControllerClass: UIViewController.Type) -> UIViewController {
        let storyboard = UIStoryboard.init(name: StoryboardName.Main.rawValue, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: String(describing: viewControllerClass.self))
        return viewController
    }
    
    func getViewController(viewControllerClassForString className: String) -> UIViewController {
        let storyboard = UIStoryboard.init(name: StoryboardName.Main.rawValue, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier:  className)
        return viewController
    }

}
