//
//  MasterViewController.swift
//  ChangingConstraints
//
//  Created by cuongdd on 20/08/2022.
//  Copyright © 2022 duycuong. All rights reserved.
//

import UIKit

class PersionModel {
    var name: String?
    var age: Int?
}

class MasterViewController: UIViewController {
    
    var listPerson = [PersionModel]()
    var detail = PersionModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(networkChange), name: .networkStateChange, object: nil)
        
        var item = PersionModel()
        item.name = "Cuong"
        item.age = 30
        listPerson.append(item)
        detail = listPerson[0]
//        listPerson.remove(at: 0)
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        #if DEBUG
        if motion == .motionShake {
            showAlertNoInternet()
        }
        #endif
    }
    
    @IBAction func showResult(_ sender: Any) {
        print("----", detail.name)
        detail.name = "Khanh Ba"
        print("----", listPerson[0].name)
    }
    @objc func networkChange(notification: Notification) {
        if let isConnect = notification.userInfo?["isOn"] as? Bool, isConnect == false {
            showAlertNoInternet()
        }
    }
    
    private func showAlertNoInternet() {
        
        // Show lock screen from the current screen
        DispatchQueue.main.async {
            guard let topVC = Utils.topViewController() else { return }
            if topVC.isKind(of: AlertViewController.self) { return }
            let vc = UIStoryboard.storyBoard(.main).viewController(of: AlertViewController.self)
            vc.modalPresentationStyle = .overFullScreen
            vc.modalTransitionStyle = .crossDissolve
            topVC.present(vc, animated: true, completion: nil)
            
//            if let navTop = topVC.navigationController {
//                vc.isPush = true
//                vc.hidesBottomBarWhenPushed = true
//                navTop.pushViewController(vc, animated: true)
//            } else {
//                vc.modalPresentationStyle = .overFullScreen
//                vc.modalTransitionStyle = .crossDissolve
//                topVC.present(vc, animated: true, completion: nil)
//            }
        }
        
    }
    
}
