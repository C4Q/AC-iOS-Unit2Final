//
//  CrayonDetailViewController+Colorize.swift
//  AC-iOS-Unit2Final
//
//  Created by Marty Hernandez Avedon on 02/16/18.
//  Copyright © 2018 Karen Fuentes. All rights reserved.
//

import UIKit

extension CrayonDetailViewController: Legibility {
    private func resetPlaceholder(for textfield: UITextField, with text: String) {
        if textfield.text != "" {
            textfield.text = nil
        }
        
        textfield.placeholder = text
    }
    
    func setUpValues(with crayon: Crayon) {
        self.resetPlaceholder(for: self.redField, with: String(crayon.red/255))
        self.resetPlaceholder(for: self.greenField, with: String(crayon.green/255))
        self.resetPlaceholder(for: self.blueField, with: String(crayon.blue/255))
        self.resetPlaceholder(for: self.alphaField, with: "1.0")
        
        self.redSlider.value = Float(crayon.red/255)
        self.greenSlider.value = Float(crayon.green/255)
        self.blueSlider.value = Float(crayon.blue/255) 
        self.alphaStepper.value = crayon.alpha
    }
    
    func setLegibleTextColors(for crayon: Crayon) {
        let legiblizedTextColor = self.makeTextLegibleOn(red: crayon.cgRed, green: crayon.cgGreen, blue: crayon.cgBlue, alpha: 1.0)
        
        self.colorNameLabel.textColor = legiblizedTextColor
        self.redLabel.textColor = legiblizedTextColor
        self.greenLabel.textColor = legiblizedTextColor
        self.blueLabel.textColor = legiblizedTextColor
        self.alphaLabel.textColor = legiblizedTextColor
    }
    
    func updateCrayon() {
        // our sliders are our source of truth
        
        let red = Double(self.redSlider.value) * 255
        let blue = Double(self.blueSlider.value) * 255
        let green = Double(self.greenSlider.value) * 255
        let alpha = Double(self.alphaStepper.value)
        
        let newCrayon = Crayon(name: "", red: red, green: green, blue: blue, alpha: alpha, hex: "")
        
        self.currentCrayon = newCrayon
    }
}
