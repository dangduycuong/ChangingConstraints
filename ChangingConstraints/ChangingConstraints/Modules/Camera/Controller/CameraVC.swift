//
//  CameraVC.swift
//  ChangingConstraints
//
//  Created by cuongdd on 22/08/2022.
//  Copyright © 2022 duycuong. All rights reserved.
//

import UIKit

class CameraVC: UIViewController {

    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var nameAlbum: UILabel!
    
    var isPush: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        closeButton.setTitle("", for: .normal)
        if let name = UserDefaults.standard.string(forKey: "okok") {
            nameAlbum.text = name
        }
        
        if isPush {
            closeButton.isHidden = true
            navigationItem.setHidesBackButton(true, animated: true)
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(closeVC))
        }
    }
    
    @objc func closeVC() {
        if isPush {
            navigationController?.popViewController(animated: true)
        } else {
            dismiss(animated: true)
        }
    }
    
    @IBAction func tapToClose(_ sender: Any) {
        closeVC()
    }
    
}
