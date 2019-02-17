//
//  ShadowView.swift
//  MindValleyDemoApp
//
//  Created by Pranil on 2/14/19.
//  Copyright © 2019 pranil. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class ShadowView: UIView {

    //MARK:- Connection Outlet
    @IBInspectable var isShadowEnabled: Bool = false
    @IBInspectable var shadowWidth: CGFloat = -1
    @IBInspectable var shadowHeight: CGFloat = 2
    @IBInspectable var shadowColor: UIColor = .lightGray
    @IBInspectable var shadowColorOpacity: Float = 0.5
    @IBInspectable var shadowRadius: CGFloat = 4
    @IBInspectable var shouldRasterize: Bool = false
    @IBInspectable var isRoundCorner: Bool = false



    //MARK:- Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()

    }


    override func layoutSubviews() {
        super.layoutSubviews()

        updateCornerRadius()
        addShadow()
    }



    //MARK:- Arrange View
    fileprivate func updateCornerRadius() {

        if isRoundCorner {

            let estimatedRadius = bounds.height / 2
            layer.cornerRadius = estimatedRadius
            layer.masksToBounds = isRoundCorner
        }
    }



    fileprivate func addShadow() {

        if isShadowEnabled {

            layer.masksToBounds = false
            layer.shadowColor = shadowColor.cgColor
            layer.shadowOpacity = shadowColorOpacity
            layer.shadowOffset = CGSize(width: shadowWidth, height: shadowHeight) // CGSize.zero
            layer.shadowRadius = shadowRadius
            layer.shouldRasterize = shouldRasterize
        }
    }


    func setRoundCorner(for side: UIRectCorner, radius: CGFloat) {

        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: side, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}
