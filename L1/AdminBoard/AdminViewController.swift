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
        if let viewController = viewController as? NavContactViewController {
            viewController.modalPresentationStyle = .fullScreen
            self.present(viewController, animated: true)
        }
    }

    @IBAction private func contactBoardView(_ sender: Any) {
        self.showContactBoard()
    }
}


class logo: UIView {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        self.draw(context)
    }
     
    private func draw(_ context: CGContext) {
        context.setStrokeColor(UIColor.white.cgColor)
        //why fill color not working ?
        context.setFillColor(UIColor.white.cgColor)
        let starLayer = CAShapeLayer()
        let starPath = UIBezierPath()
        starPath.move(to: .init(x: 200, y: 120))
        starPath.addLine(to: .init(x: 130, y: 240))
        starPath.addLine(to: .init(x: 30, y: 240))
        starPath.addLine(to: .init(x: 100, y: 300))
        starPath.addLine(to: .init(x: 50, y: 400))
        starPath.addLine(to: .init(x: 200, y: 320))
        starPath.addLine(to: .init(x: 350, y: 400))
        starPath.addLine(to: .init(x: 300, y: 300))
        starPath.addLine(to: .init(x: 370, y: 240))
        starPath.addLine(to: .init(x: 270, y: 240))
        starPath.close()
        starPath.stroke()
        starLayer.path = starPath.cgPath
        self.layer.mask = starLayer

    }



}
