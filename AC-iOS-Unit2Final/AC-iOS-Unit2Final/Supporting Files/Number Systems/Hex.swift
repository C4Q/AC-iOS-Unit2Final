//
//  Hex.swift
//  AC-iOS-Unit2Final
//
//  Created by Marty Hernandez Avedon on 02/18/18.
//  Copyright © 2018 Karen Fuentes. All rights reserved.
//

import UIKit

struct Hex: NumberSystem {    
    let hexadecimal = 16
    
    func properKeyboard() -> UIKeyboardType {
        return UIKeyboardType.alphabet
    }
    
    func textfieldSafe(value: Float) -> String {
        let intValue = Int(value * 255)
        
        return String(intValue, radix: hexadecimal)
    }
    
    func crayonToText(for fields: (red: UITextField, green: UITextField, blue: UITextField, alpha: UITextField), crayon: Crayon) {
        resetPlaceholder(for: fields.red, with: crayon.hexRed)
        resetPlaceholder(for: fields.green, with: crayon.hexGreen)
        resetPlaceholder(for: fields.blue, with: crayon.hexBlue)
    }
    
    func validateAndConvert(text: String, errorHandler: (String) -> Void) -> Float? {
        let legalCharacters = ["a", "b", "c", "d", "e", "f", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
        let filteredInput = text.lowercased().filter { legalCharacters.contains(String($0)) }
        
        guard text.count == 2 else { 
            let message = "You must enter a hex code two characters long."
            
            errorHandler(message)
            
            return nil
        }
        
        guard filteredInput.count == 2 else { 
            let message = "You must enter only digits, or letter between a & f in the alphabet."
            
            errorHandler(message)
            
            return nil
        }
        
        guard let convertToBaseTen = Int(text, radix: hexadecimal) else { 
            let message = "You must enter a value we can convert to a decimal number."
            
            errorHandler(message)
            
            return nil
        }
        
        let floatedInput = Float(convertToBaseTen)/255.0
        
        return floatedInput
    }
}
