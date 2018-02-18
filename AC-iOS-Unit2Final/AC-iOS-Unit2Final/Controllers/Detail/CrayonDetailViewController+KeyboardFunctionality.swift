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
        if self.base == NumberBase.ten {
            self.redField.keyboardType = UIKeyboardType.decimalPad
            self.greenField.keyboardType = UIKeyboardType.decimalPad
            self.blueField.keyboardType = UIKeyboardType.decimalPad
        } else if self.base == NumberBase.hex {
            self.redField.keyboardType = UIKeyboardType.alphabet
            self.greenField.keyboardType = UIKeyboardType.alphabet
            self.blueField.keyboardType = UIKeyboardType.alphabet
            
            self.redField.autocorrectionType = .no
            self.greenField.autocorrectionType = .no
            self.blueField.autocorrectionType = .no
        }
    }
    
    func errorAlert(with title: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: "Please try again.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { (action: UIAlertAction!) in
                return
        }))
        
        return alert
    }
}
