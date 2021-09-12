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
        
        gradient.colors = [UIColor.init(red: 221/255.0, green: 214/255.0, blue: 243/255.0, alpha: 1).cgColor,
                           UIColor.init(red: 250/255.0, green: 172/255.0, blue: 168/255.0, alpha: 1).cgColor,
                           UIColor.init(red: 247/255.0, green: 126/255.0, blue: 120/255.0, alpha: 1).cgColor]
        gradient.locations = [0.0, 0.5, 1.0]
        gradient.frame = self.bounds
        self.layer.insertSublayer(gradient, at: 0)
    }
}
