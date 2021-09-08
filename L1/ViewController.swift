//
//  ViewController.swift
//  L1
//
//  Created by Aleksandrs Sivickis on 06/09/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var loginField: UITextField!
    
    @IBOutlet private weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction private func enterPressed(_ sender: Any) {
        let loginName = loginField.text
        let password = passwordField.text
        
        if loginName == "admin" && password == "123" {
            print("Authorized")
            
        }
    }
    
}

