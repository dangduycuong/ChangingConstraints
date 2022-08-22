//
//  AlertViewController.swift
//  ChangingConstraints
//
//  Created by cuongdd on 21/08/2022.
//  Copyright © 2022 duycuong. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    var closeAlert: (() -> Void)?
    var isPush: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if isPush {
            navigationController?.navigationBar.isHidden = false
            navigationItem.setHidesBackButton(true, animated: true)
        }
        NotificationCenter.default.addObserver(self, selector: #selector(handleWhenNetworkStateChange), name: .networkStateChange, object: nil)
        
        contentView.layer.cornerRadius = 16
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOpacity = 1
        contentView.layer.shadowOffset = .zero
        contentView.layer.shadowRadius = 10
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @objc private func handleWhenNetworkStateChange(notification: Notification) {
        if let isConnect = notification.userInfo?["isOn"] as? Bool, isConnect {
            backToPreviousScreen()
        }
    }
    
    private func backToPreviousScreen() {
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
//            if let nav = self.navigationController, nav.viewControllers.count > 1 {
//                self.navigationController?.popViewController(animated: true)
//            } else {
//                self.dismiss(animated: true, completion: nil)
//            }
        }
    }
    
    @IBAction func okClicked(_ sender: Any) {
        backToPreviousScreen()
//        if isPush {
//            navigationController?.popViewController(animated: true)
//        } else {
//            dismiss(animated: true, completion: closeAlert)
//        }
        
        
    }
    
}
