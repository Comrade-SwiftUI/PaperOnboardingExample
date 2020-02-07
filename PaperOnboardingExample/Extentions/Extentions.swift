//
//  Extentions.swift
//  PaperOnboardingExample
//
//  Created by Bhavesh Chavda on 05/02/20.
//  Copyright © 2020 BhaveshChavda. All rights reserved.
//

import Foundation
import UIKit

// This file contains custom extended UIColors   - Thanks to Ralf Ebert for his amazing color picker tool
extension UIColor{
    static var gloomyBlue = UIColor(red: 20/255, green: 100/255, blue: 175/255, alpha: 1)
    static var gloomyGreen = UIColor(red: 0.0784, green: 0.6275, blue: 0.2157, alpha: 1.0)
    static var gloomyYellow = UIColor(red: 0.8863, green: 0.8118, blue: 0.1137, alpha: 1.0)
    static var lightGray = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1.0)
    static var lightCyan = UIColor(red: 0.9686, green: 0.9843, blue: 1, alpha: 1.0)
    static var lightBlue = UIColor(red: 109/255, green: 188/255, blue: 237/255, alpha: 1.0)
    static var lightDark = UIColor(red: 0.3765, green: 0.3765, blue: 0.3765, alpha: 1.0)
    static var lightPink = UIColor(red: 1, green: 0.3882, blue: 0.9176, alpha: 1.0)
    static var cyanGreen = UIColor(red: 0.0627, green: 0.8078, blue: 0.6824, alpha: 1.0)
    static var customGreen = UIColor(red: 0.4235, green: 0.7569, blue: 0.1647, alpha: 1.0)
    static let darkBlue = UIColor(red: 0.1294, green: 0.2706, blue: 0.3765, alpha: 1.0) /* #214560 */
}

 //MARK: -UIView
extension UIView{
    
    func anchor (top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, paddingTop: CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat, paddingRight: CGFloat, width: CGFloat, height: CGFloat, enableInsets: Bool) {
        var topInset = CGFloat(0)
        var bottomInset = CGFloat(0)
        
        if #available(iOS 11, *), enableInsets {
            let insets = self.safeAreaInsets
            topInset = insets.top
            bottomInset = insets.bottom
            
        }
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop+topInset).isActive = true
        }
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom-bottomInset).isActive = true
        }
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
    }
    
    func anchor(centerX: NSLayoutXAxisAnchor?, centerY: NSLayoutYAxisAnchor?, top: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, topPadding: CGFloat, rightPadding: CGFloat, bottomPadding: CGFloat, leftPadding: CGFloat, height: CGFloat, width: CGFloat) {
        
        /*
         Center X and Center Y
         */
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: topPadding).isActive = true
        }
        
        if let right = right {
            self.rightAnchor.constraint(equalTo: right, constant: -rightPadding).isActive = true
        }
        
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: -bottomPadding).isActive = true
        }
        
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: leftPadding).isActive = true
        }
        
        if let centerX = centerX {
            self.centerXAnchor.constraint(equalTo: centerX).isActive = true
        }
        
        if let centerY = centerY {
            self.centerYAnchor.constraint(equalTo: centerY).isActive = true
        }
        
        
        
        if height != 0 {
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
        if width != 0 {
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
    }
    
    
    func centerAnchor(centerX: NSLayoutXAxisAnchor?, centerY: NSLayoutYAxisAnchor?) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let centerX = centerX {
            self.centerXAnchor.constraint(equalTo: centerX).isActive = true
        }
        
        if let centerY = centerY {
            self.centerYAnchor.constraint(equalTo: centerY).isActive = true
        }
    }
    
    func centerAnchor(centerX: NSLayoutXAxisAnchor?, centerY: NSLayoutYAxisAnchor?, width: CGFloat, height: CGFloat) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let centerX = centerX {
            self.centerXAnchor.constraint(equalTo: centerX).isActive = true
        }
        
        if let centerY = centerY {
            self.centerYAnchor.constraint(equalTo: centerY).isActive = true
        }
        
        if width != 0 {
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if height != 0 {
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}


// Extension developed and received for Sean Allen
extension UIButton {
    
    // Animate a button with a pulse sensation
    func pulsate() {
        
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.3
        pulse.fromValue = 0.95
        pulse.toValue = 1.0
        pulse.autoreverses = false
        pulse.repeatCount = 0
        pulse.initialVelocity = 0.5
        pulse.damping = 1.0
        
        layer.add(pulse, forKey: "pulse")
    }
    
    // Animate the button with a flash sensation
    func flash() {
        
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 0.5
        flash.fromValue = 1
        flash.toValue = 0.1
        flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        flash.autoreverses = true
        flash.repeatCount = 3
        
        layer.add(flash, forKey: nil)
    }
    
    // Animate the button with a shaky sensation
    func shake() {
        
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 2
        shake.autoreverses = true
        
        let fromPoint = CGPoint(x: center.x - 5, y: center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x: center.x + 5, y: center.y)
        let toValue = NSValue(cgPoint: toPoint)
        
        shake.fromValue = fromValue
        shake.toValue = toValue
        
        layer.add(shake, forKey: "position")
    }
}

 //MARK: -UIColor
extension UIColor {
    convenience init?(hexString: String) {
        var chars = Array(hexString.hasPrefix("#") ? hexString.dropFirst() : hexString[...])
        switch chars.count {
        case 3: chars = chars.flatMap { [$0, $0] }; fallthrough
        case 6: chars = ["F","F"] + chars
        case 8: break
        default: return nil
        }
        self.init(red: .init(strtoul(String(chars[2...3]), nil, 16)) / 255,
                green: .init(strtoul(String(chars[4...5]), nil, 16)) / 255,
                 blue: .init(strtoul(String(chars[6...7]), nil, 16)) / 255,
                alpha: .init(strtoul(String(chars[0...1]), nil, 16)) / 255)
    }
}
