//
//  CrayonDetailViewController+Colorize.swift
//  AC-iOS-Unit2Final
//
//  Created by Marty Hernandez Avedon on 02/16/18.
//  Copyright © 2018 Karen Fuentes. All rights reserved.
//

import UIKit

extension CrayonDetailViewController: Legibility {
    func setLegibleTextColors(for crayon: Crayon) {
        let legiblizedTextColor = self.makeTextLegibleOn(red: crayon.cgRed, green: crayon.cgGreen, blue: crayon.cgBlue, alpha: 1.0)
        
        self.colorNameLabel.textColor = legiblizedTextColor
        self.alphaLabel.textColor = legiblizedTextColor
    }
    
    func updateCrayon() {
        let intRed = Int(self.redSlider.value * 255)
        let intGreen = Int(self.greenSlider.value * 255)
        let intBlue = Int(self.blueSlider.value * 255)
        
        let red = String(intRed, radix: 16)
        let green = String(intGreen, radix: 16)
        let blue = String(intBlue, radix: 16)
        
        let hexString = "#\(red)\(green)\(blue)"
        
        let newCrayon = Crayon(name: "", hex: hexString)
        
        self.currentCrayon = newCrayon
    }
}
