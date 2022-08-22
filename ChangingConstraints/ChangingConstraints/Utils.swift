//
//  Utils.swift
//  ChangingConstraints
//
//  Created by cuongdd on 21/08/2022.
//  Copyright © 2022 duycuong. All rights reserved.
//

import UIKit
import SystemConfiguration

class Utils: NSObject {
    
    class func topViewController(_ base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(nav.topViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(selected)
            }
        }
        
        if let child = base?.children.last {
            return topViewController(child)
        }
        
        if let presented = base?.presentedViewController {
            return topViewController(presented)
        }
        return base
    }
}

