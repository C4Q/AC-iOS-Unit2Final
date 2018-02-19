//
//  BaseTen.swift
//  AC-iOS-Unit2Final
//
//  Created by Marty Hernandez Avedon on 02/18/18.
//  Copyright © 2018 Karen Fuentes. All rights reserved.
//

import UIKit

struct BaseTen: NumberSystem {
    func properKeyboard() -> UIKeyboardType {
        return UIKeyboardType.decimalPad
    }
    
    func textfieldSafe(value: Float) -> String {
        return String(value)
    }
    
    func validateAndConvert(text: String, errorHandler: (String) -> Void) -> Float? {
        guard let floatedText = Float(text) else { 
            let message = "You must enter a decimal value."
            
            errorHandler(message)
            
            return nil
        }
        
        guard floatedText <= 1 else { 
            let message = "You must enter a decimal value less than or equal to 1."
            
            errorHandler(message)
            
            return nil
        }
        
        return floatedText
    }
    
    func fillInText(for fields: (red: UITextField, green: UITextField, blue: UITextField, alpha: UITextField), withDataFrom crayon: Crayon) {
        resetPlaceholder(for: fields.red, with: String(crayon.red/255))
        resetPlaceholder(for: fields.green, with: String(crayon.green/255))
        resetPlaceholder(for: fields.blue, with: String(crayon.blue/255))
        
        resetPlaceholder(for: fields.alpha, with: "1.0")
    }
}


