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
        let legiblizedTextColor = self.makeTextLegibleOn(red: crayon.cgRed, green: crayon.cgGreen, blue: crayon.cgBlue, alpha: crayon.cgAlpha)
        
        self.colorNameLabel.textColor = legiblizedTextColor
        self.alphaLabel.textColor = legiblizedTextColor
    }
    
    func updateCrayon() {
        
        let intRed = Int(self.redSlider.value * 255)
        let intGreen = Int(self.greenSlider.value * 255)
        let intBlue = Int(self.blueSlider.value * 255)
        
        let red = self.redSlider.value > 0.065 ? String(intRed, radix: 16) : "00"
        let green = self.greenSlider.value > 0.065 ? String(intGreen, radix: 16) : "00"
        let blue = self.blueSlider.value > 0.065 ? String(intBlue, radix: 16) : "00"
        
        let hexString = "#\(red)\(green)\(blue)"
        
        let newCrayon = Crayon(name: "", hex: hexString, alpha: self.alphaStepper.value)
        self.currentCrayon = newCrayon
    }
}
