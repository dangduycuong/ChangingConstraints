//
//  IdentifierView.swift
//  ChangingConstraints
//
//  Created by cuongdd on 21/08/2022.
//  Copyright © 2022 duycuong. All rights reserved.
//

import UIKit

//
// MARK: - Identifier
// Easily to get ViewID and XIB file
protocol Identifier {
    
    /// ID view
    static var identifierView: String {get}
    
    /// XIB - init XIB from identifierView
    static func xib() -> UINib?
}
//
// MARK: - Default Implementation for Identifier

import UIKit

//
// MARK: - Default Implementation for Identifier
extension UIViewController: Identifier {
    
    /// ID View
    static var identifierView: String {
        get {
            return String(describing: self)
        }
    }
    
    /// XIB
    static func xib() -> UINib? {
        return UINib(nibName: self.identifierView, bundle: nil)
    }
}

extension UIView: Identifier {
    
    /// ID View
    static var identifierView: String {
        get {
            return String(describing: self)
        }
    }
    
    /// XIB
    static func xib() -> UINib? {
        return UINib(nibName: self.identifierView, bundle: nil)
    }
    
    class func instanceFromXib() -> UIView? {
        return xib()?.instantiate(withOwner: nil, options: nil).first as? UIView
    }
}
