//
//  ViewController.swift
//  AppLogictics
//
//  Created by cuongdd on 22/08/2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var meowButton: UIButton!
    
    var phoneNumber: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneTextField.delegate = self
//        meowButton.setTitle("", for: .normal)
    }
    
    @IBAction func meowClicked(_ sender: Any) {
        view.endEditing(true)
        if let url = URL(string: "myphotoapp:Vacation?index=\(phoneNumber)") {
            UIApplication.shared.open(url) { (result) in
                if result {
                    // The URL was delivered successfully!
                    print("---- mo ra duoc roi", self.phoneNumber)
                }
            }
        }
    }
    
}

extension ViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if let text = textField.text {
            phoneNumber = text
        }
    }
}
