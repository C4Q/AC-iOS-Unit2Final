//
//  DetailedViewController.swift
//  AC-iOS-Unit2Final
//
//  Created by Richard Crichlow on 11/10/17.
//  Copyright © 2017 Karen Fuentes. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController, UITextFieldDelegate {
    
    //The Instance of the Segued Cell
    var detailedCrayon: Crayon?
    
    //Labels
    @IBOutlet weak var detailedCrayonNameLabel: UILabel!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var alphaLabel: UILabel!
    
    var allLabels: [UILabel] = []
    
    //Actions
    var sliderRedValue = Float() {
        didSet {
            self.redLabel.text = "Red: " + String(sliderRedValue)
            self.colorView.backgroundColor = UIColor(displayP3Red: CGFloat(sliderRedValue), green: CGFloat(sliderGreenValue), blue: CGFloat(sliderBlueValue), alpha: CGFloat(stepperNumber))
            if sliderRedValue < 0.1 {
                allLabels = [detailedCrayonNameLabel, redLabel, greenLabel, blueLabel, alphaLabel]
                for label in allLabels {
                    label.backgroundColor = UIColor.darkGray
                }
            } else {
                for label in allLabels {
                    label.backgroundColor = UIColor.clear
                }
            }
        }
    }
    @IBAction func redSliderAction(_ sender: UISlider) {
        self.sliderRedValue = sender.value
    }
    var sliderGreenValue = Float() {
        didSet {
            self.greenLabel.text = "Green: " + String(sliderGreenValue)
            self.colorView.backgroundColor = UIColor(displayP3Red: CGFloat(sliderRedValue), green: CGFloat(sliderGreenValue), blue: CGFloat(sliderBlueValue), alpha: CGFloat(stepperNumber))
            if sliderGreenValue < 0.1 {
                allLabels = [detailedCrayonNameLabel, redLabel, greenLabel, blueLabel, alphaLabel]
                for label in allLabels {
                    label.backgroundColor = UIColor.darkGray
                }
            } else {
                for label in allLabels {
                    label.backgroundColor = UIColor.clear
                }
            }
        }
    }
    @IBAction func greenSliderAction(_ sender: UISlider) {
        self.sliderGreenValue = sender.value
    }
    var sliderBlueValue = Float() {
        didSet {
            self.blueLabel.text = "Blue: " + String(sliderBlueValue)
            self.colorView.backgroundColor = UIColor(displayP3Red: CGFloat(sliderRedValue), green: CGFloat(sliderGreenValue), blue: CGFloat(sliderBlueValue), alpha: CGFloat(stepperNumber))
            if sliderBlueValue < 0.1 {
                allLabels = [detailedCrayonNameLabel, redLabel, greenLabel, blueLabel, alphaLabel]
                for label in allLabels {
                    label.backgroundColor = UIColor.darkGray
                }
            } else {
                for label in allLabels {
                    label.backgroundColor = UIColor.clear
                }
            }
        }
    }
    @IBAction func blueSliderAction(_ sender: UISlider) {
        self.sliderBlueValue = sender.value
    }
    var stepperNumber: Double = 1.0 {
        didSet {
            alphaLabel.text = "Alpha: \(stepperNumber)"
            alphaStepperOutlet.value = stepperNumber
            self.colorView.backgroundColor = UIColor(displayP3Red: CGFloat(sliderRedValue), green: CGFloat(sliderGreenValue), blue: CGFloat(sliderBlueValue), alpha: CGFloat(stepperNumber))
        }
    }
    @IBAction func alphaStepperAction(_ sender: UIStepper) {
        stepperNumber = sender.value
    }
    @IBAction func resetButton(_ sender: UIButton) {
        reset()
    }
    
    //Outlets
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let characterSet = CharacterSet.decimalDigits
        
        if string.rangeOfCharacter(from: characterSet.inverted) != nil {
            return false
        }
        if textField == redTextField {
            guard redTextField.text != nil else {return true}
            let redText = "." + redTextField.text! + string
            if let newInt = Float(redText) {
                self.sliderRedValue = newInt
            }
        }
        if textField == greenTextField {
            guard greenTextField.text != nil else {return true}
            let greenText = "." + greenTextField.text! + string
            if let newInt = Float(greenText) {
                self.sliderGreenValue = newInt
            }
        }
        if textField == blueTextField {
            guard blueTextField.text != nil else {return true}
            let blueText = "." + blueTextField.text! + string
            if let newInt = Float(blueText) {
                self.sliderBlueValue = newInt
            }
        }
        return true
    }
    
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var redSliderOutlet: UISlider!
    @IBOutlet weak var greenSliderOutlet: UISlider!
    @IBOutlet weak var blueSliderOutlet: UISlider!
    @IBOutlet weak var alphaStepperOutlet: UIStepper!
    @IBOutlet weak var resetButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.redTextField.delegate = self
        self.greenTextField.delegate = self
        self.blueTextField.delegate = self
        guard let detailedCrayon = detailedCrayon else {
            return
        }//This is to make sure there is a Crayon to show details for
        
        detailedCrayonNameLabel.text = detailedCrayon.name
        reset()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reset()
    }
    
    func reset() {
        stepperNumber = 1.0
        sliderRedValue = (Float((detailedCrayon?.red)! / 255))
        sliderGreenValue = (Float((detailedCrayon?.green)! / 255))
        sliderBlueValue = (Float((detailedCrayon?.blue)! / 255))
        alphaStepperOutlet.value = 1.0
        redSliderOutlet.value = sliderRedValue
        greenSliderOutlet.value = sliderGreenValue
        blueSliderOutlet.value = sliderBlueValue
        self.colorView.backgroundColor = UIColor(displayP3Red: CGFloat(sliderRedValue), green: CGFloat(sliderGreenValue), blue: CGFloat(sliderBlueValue), alpha: 1)
        alphaLabel.text = "Alpha: \(stepperNumber)"
        self.greenLabel.text = "Green: " + String(sliderGreenValue)
        self.blueLabel.text = "Blue: " + String(sliderBlueValue)
        self.redLabel.text = "Red: " + String(sliderRedValue)
        redTextField.text = ""
        blueTextField.text = ""
        greenTextField.text = ""
    }

}
