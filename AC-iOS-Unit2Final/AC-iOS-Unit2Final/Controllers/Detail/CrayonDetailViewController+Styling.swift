//
//  CrayonDetailViewController+Styling.swift
//  AC-iOS-Unit2Final
//
//  Created by Marty Hernandez Avedon on 02/17/18.
//  Copyright © 2018 Karen Fuentes. All rights reserved.
//

import UIKit

extension CrayonDetailViewController {
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
