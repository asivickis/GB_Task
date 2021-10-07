//
//  ViewController.swift
//  L1
//
//  Created by Aleksandrs Sivickis on 06/09/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var loginField: UITextField!
    
    @IBOutlet private weak var startView: UIView!
    
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
        //let storyBoard = UIStoryboard(name: "AdminBoard", bundle: nil)
        //let viewController = storyBoard.instantiateInitialViewController()
        //if let viewController = viewController as? AdminViewController {
            //viewController.modalPresentationStyle = .fullScreen
        let viewController = UIStoryboard(name: "AdminBoard", bundle: nil).instantiateInitialViewController()!
            viewController.transitioningDelegate = self
            self.present(viewController, animated: true)
        }
    //}
    
    @IBAction private func enterPressed(_ sender: Any) {
        let loginName = loginField.text
        let password = passwordField.text
        
        if loginName == "" && password == "" {
            print("Authorized")
            self.showAdminBoard()
        } else {
            self.showAlert()
        }
    }
    
}

extension ViewController: UIViewControllerTransitioningDelegate {
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return nil
    }
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        //Amir, vaw kod ne rabotaet
        return ViewControllerPresenter(startFrame: self.startView.frame)
    }
}

class ViewControllerPresenter: NSObject, UIViewControllerAnimatedTransitioning {
    
    let startFrame: CGRect
    
    init(startFrame : CGRect) {
        self.startFrame = startFrame
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toView = transitionContext.viewController(forKey: .to)?.view else { return }
        
        toView.frame = self.startFrame
        transitionContext.containerView.addSubview(toView)
        
        let duration = transitionDuration(using: transitionContext)
        
        UIView.animate(withDuration: duration) {
            toView.frame = transitionContext.containerView.frame
        } completion: { didCompleted in
            transitionContext.completeTransition(didCompleted)
        }
    }
    
    
}
