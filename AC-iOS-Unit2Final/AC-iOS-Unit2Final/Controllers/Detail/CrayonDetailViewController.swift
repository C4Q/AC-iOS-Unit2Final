//
//  CrayonDetailViewController.swift
//  AC-iOS-Unit2Final
//
//  Created by Marty Hernandez Avedon on 02/14/18.
//  Copyright © 2018 Karen Fuentes. All rights reserved.
//

import UIKit

class CrayonDetailViewController: UIViewController {
    var crayon: Crayon!
    // this start off derived from self.crayon, but then we let the sliders give it values
    var currentColor: UIColor! {
        didSet {
            self.view.backgroundColor = currentColor
        }
    }
    
    @IBOutlet weak var colorNameLabel: UILabel!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var alphaLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redField: UITextField!
    @IBOutlet weak var greenField: UITextField!
    @IBOutlet weak var blueField: UITextField!
    
    @IBOutlet weak var alphaStepper: UIStepper!
    @IBOutlet weak var alphaField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.colorNameLabel.text = self.crayon.name
        
        self.redField.placeholder = String(self.crayon.red/255)
        self.greenField.placeholder = String(self.crayon.green/255)
        self.blueField.placeholder = String(self.crayon.blue/255)
        self.alphaField.placeholder = "1.0"
        
        self.redSlider.value = Float(self.crayon.red/255)
        self.greenSlider.value = Float(self.crayon.green/255)
        self.blueSlider.value = Float(self.crayon.blue/255)
        
        let legiblizedTextColor = self.makeTextLegible(red: CGFloat(crayon.red), green: CGFloat(crayon.green), blue: CGFloat(crayon.blue), alpha: 1.0)
        
        self.colorNameLabel.textColor = legiblizedTextColor
        self.redLabel.textColor = legiblizedTextColor
        self.greenLabel.textColor = legiblizedTextColor
        self.blueLabel.textColor = legiblizedTextColor
        self.alphaLabel.textColor = legiblizedTextColor
    }
    
    @IBAction func resetButtonWasTapped(_ sender: UIButton) {
        currentColor = crayon.getUIColor()
        
        // also move sliders back in place
        
        self.redField.placeholder = String((Float(self.crayon.red)/255.0))
        self.greenField.placeholder = String(Float((self.crayon.green)/255.0))
        self.blueField.placeholder = String((Float(self.crayon.blue)/255.0))
        self.alphaField.placeholder = "1.0"
        
        self.redSlider.value = Float(self.crayon.red/255)
        self.greenSlider.value = Float(self.crayon.green/255)
        self.blueSlider.value = Float(self.crayon.blue/255)
    }
    
    @IBAction func sliderMoved(_ sender: UISlider) {
        switch sender {
        case self.redSlider:
            self.redField.placeholder = String(sender.value)
        case self.greenSlider:
            self.greenField.placeholder = String(sender.value)
        case self.blueSlider:
            self.blueField.placeholder = String(sender.value)
        default:
            return
        }
        
        self.updateColor()
    }
    
    @IBAction func stepperTapped(_ sender: UIStepper) {
        self.alphaField.placeholder = String(sender.value)
        
        self.updateColor()
    }
    
    @IBAction func fieldEdited(_ sender: UITextField) {
        guard let userInput = sender.text else {
            return
        }
        
        if userInput.isEmpty {
            return
        }
        
        guard let newValue = Float(userInput) else {
            return
        }
        
        switch sender {
        case redField:
            self.redSlider.value = newValue
        case greenField:
            self.greenSlider.value = newValue
        case blueField:
            self.blueSlider.value = newValue
        default:
            return
        }
        
        self.updateColor()
    }
    
    
    private func createColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(displayP3Red: red, green: green, blue: blue, alpha: alpha)
    }
    
    private func makeTextLegible(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        if red + green + blue <= 1.25 || alpha <= 0.8 {
            return UIColor.white
        } else {
            return UIColor.black
        }
    }
    
    private func updateColor() {
        var red: String
        let green: String
        let blue: String
        let alpha: String
        
        if self.redField.text != "" {
            red = self.redField.text!
        } else {
            red = self.redField.placeholder!
        }
        
        if self.greenField.text != "" {
            green = self.greenField.text!
        } else {
            green = self.greenField.placeholder!
        }
        
        if self.blueField.text != "" {
            blue = self.blueField.text!
        } else {
            blue = self.blueField.placeholder!
        }
        
        if self.alphaField.text != "" {
            alpha = self.alphaField.text!
        } else {
            alpha = self.alphaField.placeholder!
        }
        
        let cgRed = CGFloat(Double(red)!)
        let cgGreen = CGFloat(Double(green)!)
        let cgBlue = CGFloat(Double(blue)!)
        let cgAlpha = CGFloat(Double(alpha)!)
        
        let legiblizedTextColor = self.makeTextLegible(red: cgRed, green: cgGreen, blue: cgBlue, alpha: cgAlpha)
        
        self.currentColor = self.createColor(red: cgRed, green: cgGreen, blue: cgBlue, alpha: cgAlpha)
        
        self.colorNameLabel.textColor = legiblizedTextColor
        self.redLabel.textColor = legiblizedTextColor
        self.greenLabel.textColor = legiblizedTextColor
        self.blueLabel.textColor = legiblizedTextColor
        self.alphaLabel.textColor = legiblizedTextColor
    }
}
