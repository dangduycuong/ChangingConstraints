//
//  AppDelegate.swift
//  ChangingConstraints
//
//  Created by duycuong on 1/23/19.
//  Copyright © 2019 duycuong. All rights reserved.
//

import UIKit
import Network

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        checkNetworkState()
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:] ) -> Bool {
        print("---- vao day khi nao")
        // Determine who sent the URL.
        let sendingAppID = options[.sourceApplication]
        print("source application = \(sendingAppID ?? "Unknown")")
        
        // Process the URL.
        guard let components = NSURLComponents(url: url, resolvingAgainstBaseURL: true),
              let albumPath = components.path,
              let params = components.queryItems else {
            print("Invalid URL or album path missing")
            return false
        }
        
        if let photoIndex = params.first(where: { $0.name == "index" })?.value {
            print("albumPath = \(albumPath)")
            print("photoIndex = \(photoIndex)")
            UserDefaults.standard.set(photoIndex, forKey: "okok")
            
            // Show lock screen from the current screen
            DispatchQueue.main.async {
                self.showCamera()
            }
            
            return true
        } else {
            print("Photo index missing")
            UserDefaults.standard.set("Photo index missing", forKey: "okok")
            return false
        }
    }
    
    private func showCamera() {
        
        // Show lock screen from the current screen
        DispatchQueue.main.async {
            guard let topVC = Utils.topViewController() else { return }
            if topVC.isKind(of: AlertViewController.self) { return }
            let vc = UIStoryboard.storyBoard(.main).viewController(of: CameraVC.self)
            //            vc.modalPresentationStyle = .overFullScreen
            //            vc.modalTransitionStyle = .crossDissolve
            //            topVC.present(vc, animated: true, completion: nil)
            
            if let navTop = topVC.navigationController {
                vc.isPush = true
                vc.hidesBottomBarWhenPushed = true
                navTop.pushViewController(vc, animated: true)
            } else {
                vc.modalPresentationStyle = .overFullScreen
                vc.modalTransitionStyle = .crossDissolve
                topVC.present(vc, animated: true, completion: nil)
            }
        }
        
    }
    
    func checkNetworkState() {
        let monitor = NWPathMonitor()
        let queue = DispatchQueue(label: "Monitor")
        monitor.start(queue: queue)
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                NotificationCenter.default.post(name: .networkStateChange, object: nil, userInfo: ["isOn": true])
            } else {
                NotificationCenter.default.post(name: .networkStateChange, object: nil, userInfo: ["isOn": false])
            }
        }
    }
    
}

