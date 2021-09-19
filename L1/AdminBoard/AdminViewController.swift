//
//  AdminViewController.swift
//  L1
//
//  Created by Aleksandrs Sivickis on 10/09/2021.
//

import UIKit

class AdminViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
}

class subAdminViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    private func showContactBoard() {
        let storyBoard = UIStoryboard(name: "ContactBoard", bundle: nil)
        let viewController = storyBoard.instantiateInitialViewController()
        if let viewController = viewController as? ContactViewController {
            self.present(viewController, animated: true)
        }
    }

    @IBAction private func contactBoardView(_ sender: Any) {
        self.showContactBoard()
    }
}
