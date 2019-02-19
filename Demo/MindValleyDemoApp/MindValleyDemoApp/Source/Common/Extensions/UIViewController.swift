//
//  UIViewController.swift
//  MindValleyDemoApp
//
//  Created by Pranil on 2/19/19.
//  Copyright © 2019 pranil. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    // Support Activity indicator
    func showActivityIndicator() {
        DispatchQueue.main.async {
            self.view.addSubview(activityIndicator)
            activityIndicator.startAnimating()
        }
    }

    func hideActivityIndicator() {
        DispatchQueue.main.async {
            activityIndicator.stopAnimating()
        }
    }
}
