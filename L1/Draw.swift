//
//  Draw.swift
//  L1
//
//  Created by Aleksandrs Sivickis on 19/09/2021.
//

import UIKit

class myDraw: UIView {
    

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setStrokeColor(UIColor.red.cgColor)
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 200, y: 120))
        path.addLine(to: CGPoint(x: 130, y: 240))
        path.addLine(to: CGPoint(x: 30, y: 240))
        path.addLine(to: CGPoint(x: 100, y: 300))
        path.addLine(to: CGPoint(x: 50, y: 400))
        path.addLine(to: CGPoint(x: 200, y: 320))
        path.addLine(to: CGPoint(x: 350, y: 400))
        path.addLine(to: CGPoint(x: 300, y: 300))
        path.addLine(to: CGPoint(x: 370, y: 240))
        path.addLine(to: CGPoint(x: 270, y: 240))
        path.close()
        path.stroke()
    }


}
