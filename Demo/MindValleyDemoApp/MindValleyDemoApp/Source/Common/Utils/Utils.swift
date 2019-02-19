//
//  Utils.swift
//  MindValleyDemoApp
//
//  Created by Pranil on 2/19/19.
//  Copyright © 2019 pranil. All rights reserved.
//

import Foundation
import UIKit

var activityIndicator : UIActivityIndicatorView = {

    let indicatorSize: CGFloat = 50
    let x = (UIScreen.main.bounds.width * 0.5) - (indicatorSize * 0.5)
    let y = (UIScreen.main.bounds.height * 0.4) - (indicatorSize * 0.5)
    let frame = CGRect(x: x, y: y, width: indicatorSize, height: indicatorSize)
    let indicator = UIActivityIndicatorView(frame: frame)
    indicator.color = UIColor.black
    return indicator
}()
