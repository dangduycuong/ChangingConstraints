//
//  ChangingConstraintsViewController.swift
//  ChangingConstraints
//
//  Created by duycuong on 1/23/19.
//  Copyright © 2019 duycuong. All rights reserved.
//

import UIKit

class ChangingConstraintsViewController: UIViewController {

    @IBOutlet weak var withGreenView: NSLayoutConstraint!
    @IBOutlet weak var topContrain: NSLayoutConstraint!
    
    var isOn: Bool = false {
        didSet {
            UIView.animate(withDuration: 2.0) {
                self.topContrain.constant = self.isOn ? 300 : 25
                self.withGreenView.constant = self.isOn ? 400 : 10
                
                self.view.layoutIfNeeded()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func clickButton(_ sender: Any) {
//        UIView.animate(withDuration: 0.35) {
//            self.topContrain.constant = 100
//            self.view.layoutIfNeeded()
//
//        }
        isOn = !isOn
    }

    
    
}

