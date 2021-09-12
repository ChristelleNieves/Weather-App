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
        
        gradient.colors = [UIColor.init(red: 62/255.0, green: 9/255.0, blue: 162/255.0, alpha: 1).cgColor,
                           UIColor.black.cgColor,
                           UIColor.black.cgColor]   // your colors go here
        gradient.locations = [0.0, 0.5, 1.0]
        gradient.frame = self.bounds
        self.layer.insertSublayer(gradient, at: 0)
    }
}
