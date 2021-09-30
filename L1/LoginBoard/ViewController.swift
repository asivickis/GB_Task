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

    private func showAlert() {
        let allertController = UIAlertController(title: "Error", message: "Wrong login or password!", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default)
        
        allertController.addAction(action)
        self.present(allertController, animated: true)
    }
    
    private func showAdminBoard() {
        let storyBoard = UIStoryboard(name: "AdminBoard", bundle: nil)
        let viewController = storyBoard.instantiateInitialViewController()
        if let viewController = viewController as? AdminViewController {
            viewController.modalPresentationStyle = .fullScreen
            self.present(viewController, animated: true)
        }
    }
    
    @IBAction private func enterPressed(_ sender: Any) {
        let loginName = loginField.text
        let password = passwordField.text
        
        if loginName == "admin" && password == "123" {
            print("Authorized")
            self.showAdminBoard()
        } else {
            self.showAlert()
        }
    }
    
    
}
