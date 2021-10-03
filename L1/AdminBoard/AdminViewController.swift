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

    var shapeLayer: CAShapeLayer?
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        self.draw(context)
        self.animate()

        
    }
     
    private func draw(_ context: CGContext) {
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
        self.addShapeLayer(path: starPath)
        
    }

    private func animate() {
        UIView.animate(withDuration: 1.0, delay: 0, options: [.repeat, .autoreverse], animations: {
            self.transform = .init(scaleX: 0.7, y: 0.7)
        }, completion: nil)
        
        let strokeEndAnimation = CABasicAnimation(keyPath: "strokeEnd")
        strokeEndAnimation.fromValue = 0
        strokeEndAnimation.toValue = 2
        
        let strokeStartAnimation = CABasicAnimation(keyPath: "stokeStart")
        strokeStartAnimation.fromValue = 0
        strokeStartAnimation.toValue = 1
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [strokeEndAnimation, strokeStartAnimation]
        animationGroup.duration = 3
        animationGroup.repeatCount = .infinity
        
        self.shapeLayer?.add(animationGroup, forKey: nil)
    }

    private func addShapeLayer(path: UIBezierPath) {
        let layer = CAShapeLayer()
        layer.path = path.cgPath
        layer.strokeColor = UIColor.yellow.cgColor
        layer.fillColor = nil
        layer.strokeStart = 0
        layer.strokeEnd = 0
        layer.lineWidth = 6
        layer.fillColor = UIColor.red.cgColor
        self.layer.addSublayer(layer)
        self.shapeLayer = layer
    }

}
