//
//  CrayonDetailViewController+Styling.swift
//  AC-iOS-Unit2Final
//
//  Created by Marty Hernandez Avedon on 02/17/18.
//  Copyright © 2018 Karen Fuentes. All rights reserved.
//

import UIKit

extension CrayonDetailViewController {
    private func resetPlaceholder(for textfield: UITextField, with text: String) {
        if textfield.text != "" {
            textfield.text = nil
        }
        
        textfield.placeholder = text
    }
    
    func setUpValues(with crayon: Crayon) {
        if self.base == NumberBase.ten {
            self.resetPlaceholder(for: self.redField, with: String(crayon.red/255))
            self.resetPlaceholder(for: self.greenField, with: String(crayon.green/255))
            self.resetPlaceholder(for: self.blueField, with: String(crayon.blue/255))
        } else if self.base == NumberBase.hex {
            self.resetPlaceholder(for: self.redField, with: crayon.hexRed)
            self.resetPlaceholder(for: self.greenField, with: crayon.hexGreen)
            self.resetPlaceholder(for: self.blueField, with: crayon.hexBlue)
        }
        
        self.resetPlaceholder(for: self.alphaField, with: "1.0")
        
        self.redSlider.value = Float(crayon.red/255)
        self.greenSlider.value = Float(crayon.green/255)
        self.blueSlider.value = Float(crayon.blue/255) 
        self.alphaStepper.value = crayon.alpha
    }
    
    func setShadows() {
        _ = [
            self.resetButton,
            self.baseSwitcher,
            self.redSlider,
            self.greenSlider,
            self.blueSlider,
            self.alphaStepper
        ].map { $0.layer.shadowColor = UIColor.black.cgColor }
        
        _ = [
            self.resetButton,
            self.baseSwitcher,
            self.redSlider,
            self.greenSlider,
            self.blueSlider,
            self.alphaStepper
        ].map { $0.layer.shadowOpacity = 0.6 }
        
        _ = [
            self.resetButton,
            self.baseSwitcher,
            self.redSlider,
            self.greenSlider,
            self.blueSlider,
            self.alphaStepper
        ].map { $0.layer.shadowOffset = CGSize(width: 0, height: 3) }
        
        _ = [
            self.resetButton,
            self.baseSwitcher,
            self.redSlider,
            self.greenSlider,
            self.blueSlider,
            self.alphaStepper
        ].map { $0.layer.shadowRadius = CGFloat(2) }
    }
}
