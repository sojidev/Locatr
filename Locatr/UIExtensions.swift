//
//  UIExtensions.swift
//  Locatr
//
//  Created by iwritecode on 3/2/17.
//  Copyright © 2017 iwc. All rights reserved.
//

import UIKit


// MARK: - UIColor extensions

extension UIColor {
    
    convenience init(hexString: String) {

        let hex = hexString.trimmingCharacters(in: NSCharacterSet.alphanumerics.inverted)
        
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.characters.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
    
}


// MARK: - UITExtField extensions

extension UITextField {
    
    func hide() {
        self.isHidden = false
        self.alpha = 1
        
        UIView.animate(withDuration: 0.25) { 
            self.alpha = 0
            self.isHidden = false
        }
    }
    
    func show() {
        self.isHidden = true
        self.alpha = 0
        
        UIView.animate(withDuration: 0.25) { 
            self.isHidden = false
            self.alpha = 1
        }
    }
    
}



