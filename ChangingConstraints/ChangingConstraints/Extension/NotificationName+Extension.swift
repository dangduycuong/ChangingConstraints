//
//  NotificationName+Extension.swift
//  ChangingConstraints
//
//  Created by cuongdd on 21/08/2022.
//  Copyright © 2022 duycuong. All rights reserved.
//

import Foundation

extension Notification.Name {
    static let dataText = Notification.Name("key")
    static var networkStateChange: Notification.Name {
        return .init(rawValue: "networkStateChange")
    }
    static var refreshData: Notification.Name {
        return .init(rawValue: "refreshData")
    }
}
