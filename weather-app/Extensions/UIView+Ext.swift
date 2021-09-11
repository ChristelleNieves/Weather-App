//
//  UIView+Ext.swift
//  weather-app
//
//  Created by Christelle Nieves on 9/10/21.
//

import Foundation
import UIKit

extension UIView {
    func applyGradient() {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.orange.cgColor,
                           UIColor.systemPink.cgColor,
                           UIColor.red.cgColor]   // your colors go here
        gradient.locations = [0.0, 0.5, 1.0]
        gradient.frame = self.bounds
        self.layer.insertSublayer(gradient, at: 0)
    }
}
