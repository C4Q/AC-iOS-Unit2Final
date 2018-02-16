//
//  Legibility.swift
//  AC-iOS-Unit2Final
//
//  Created by Marty Hernandez Avedon on 02/16/18.
//  Copyright © 2018 Karen Fuentes. All rights reserved.
//

import UIKit

protocol Legibility {
    func makeTextLegibleOn(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor
}

extension Legibility {
    private func isDarkAndUnsaturated(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> Bool {
        return red < 0.45 && green < 0.45 && blue < 0.45 
    }
    
    private func isDarkAndSaturated(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> Bool {
        if red < 0.5 && green < 0.5 && blue > 0.45 { return true }
        if red > 0.5 && green < 0.5 && blue < 0.45 { return true }
        if red < 0.5 && green > 0.5 && blue < 0.45 { return true }
        
        return false
    }
    
    private func isLowContrast(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> Bool {
        if red < 0.3 && green < 0.7 && blue < 0.7 { return true }
        if red > 0.6 && green < 0.7 && blue < 0.3 { return true }
        if red < 0.7 && green > 0.3 && blue < 0.7 { return true }
        
        return false
    }
    
    func makeTextLegibleOn(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        if isDarkAndUnsaturated(red: red, green: green, blue: blue, alpha: alpha) || isDarkAndSaturated(red: red, green: green, blue: blue, alpha: alpha) || isLowContrast(red: red, green: green, blue: blue, alpha: alpha) || alpha < 0.7 {
            return UIColor.white
        } else {
            return UIColor.black
        }
    }
}
