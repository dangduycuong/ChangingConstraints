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
    
    @IBOutlet weak var widthImage: NSLayoutConstraint!
    
    var timer = Timer()
    
    var isOn: Bool = false {
        didSet {
            UIView.animate(withDuration: 0.35) {
                self.topContrain.constant = self.isOn ? 300 : 25
                self.withGreenView.constant = self.isOn ? 400 : 10
                
                self.view.layoutIfNeeded()
            }
        }
    }
    
    var isZooming: Bool = false {
        didSet {
            UIView.animate(withDuration: 2.0) {
                self.widthImage.constant = self.isZooming ? UIScreen.main.bounds.width * 1.5 : UIScreen.main.bounds.width/2
                self.view.layoutIfNeeded()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(zoomingImage), userInfo: nil, repeats: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func zoomingImage() {
        isZooming = !isZooming
    }
    
    @IBAction func clickButton(_ sender: Any) {
        //        isOn = !isOn
        isZooming = !isZooming
    }
    
    
    
}


