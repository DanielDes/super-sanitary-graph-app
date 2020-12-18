//
//  UIColor++.swift
//  SuperSanitaryGraphApp
//
//  Created by L Daniel De San Pedro on 18/12/20.
//

import Foundation
import UIKit


extension UIColor {
    
    
    convenience init(hex: String) {
        var hexString : String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (hexString.hasPrefix("#")) {
            hexString.remove(at: hexString.startIndex)
        }

        var rgbValue:UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&rgbValue)
        
        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0
        let alpha = CGFloat(1.0)
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
        
    }
}
