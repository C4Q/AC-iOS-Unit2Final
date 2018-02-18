//
//  NumberSystem.swift
//  AC-iOS-Unit2Final
//
//  Created by Marty Hernandez Avedon on 02/18/18.
//  Copyright © 2018 Karen Fuentes. All rights reserved.
//

import UIKit

protocol NumberSystem {
    func validateAndConvert(text: String, errorHandler: (String) -> Void) -> Float?
    func textfieldSafe(value: Float) -> String
    func properKeyboard() -> UIKeyboardType
    func crayonToText(for fields: (red: UITextField, green: UITextField, blue: UITextField, alpha: UITextField), crayon: Crayon) -> Void
    func crayonToValue(sliders: (red: UISlider, green: UISlider, blue: UISlider), stepper alpha: UIStepper, crayon: Crayon) -> Void
}

extension NumberSystem {
    func errorAlert(with title: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: "Please try again.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { (action: UIAlertAction!) in
            return
        }))
        
        return alert
    }
    
    func resetPlaceholder(for textfield: UITextField, with text: String) {
        if textfield.text != "" {
            textfield.text = nil
        }
        
        textfield.placeholder = text
    }
    
    func crayonToValue(sliders: (red: UISlider, green: UISlider, blue: UISlider), stepper alpha: UIStepper, crayon: Crayon) {
        sliders.red.value = Float(crayon.red/255)
        sliders.green.value = Float(crayon.green/255)
        sliders.blue.value = Float(crayon.blue/255) 
        
        alpha.value = crayon.alpha
    }
}
