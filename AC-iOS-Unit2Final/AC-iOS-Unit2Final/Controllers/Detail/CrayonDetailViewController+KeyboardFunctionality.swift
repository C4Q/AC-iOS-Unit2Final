//
//  CrayonDetailViewController+ErrorAlert.swift
//  AC-iOS-Unit2Final
//
//  Created by Marty Hernandez Avedon on 02/17/18.
//  Copyright © 2018 Karen Fuentes. All rights reserved.
//

import UIKit

extension CrayonDetailViewController {
    
    func setKeyboards() {
        self.redField.keyboardType = self.numberSystemManager.currentSystem.properKeyboard()
        self.greenField.keyboardType = self.numberSystemManager.currentSystem.properKeyboard()
        self.blueField.keyboardType = self.numberSystemManager.currentSystem.properKeyboard()
        
        self.redField.autocorrectionType = .no
        self.greenField.autocorrectionType = .no
        self.blueField.autocorrectionType = .no
    }
}
