//
//  label_custom.swift
//  app1
//
//  Created by Кирилл on 10.05.2021.
//

import Foundation
import UIKit

class label_custom: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addlabel()
    }
    public func addlabel() {
        let view = UILabel(frame: CGRect(x: 0, y: 0, width: 375, height: 457))

      //  view.backgroundColor = .white


        let layer0 = CAGradientLayer()

        layer0.colors = [

          UIColor(red: 0.078, green: 0.051, blue: 0.212, alpha: 1).cgColor,

          UIColor(red: 1, green: 1, blue: 1, alpha: 0).cgColor

        ]

        layer0.locations = [0.46, 0.82]

        layer0.startPoint = CGPoint(x: 0.25, y: 0.5)

        layer0.endPoint = CGPoint(x: 0.75, y: 0.5)

        layer0.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0, b: 1, c: -1, d: 0, tx: 1, ty: 0))

        layer0.bounds = view.bounds.insetBy(dx: -0.5*view.bounds.size.width, dy: -0.5*view.bounds.size.height)

        layer0.position = view.center

        view.layer.addSublayer(layer0)


        self.addSubview(view)

        view.translatesAutoresizingMaskIntoConstraints = false
    }
}

