//
//  CrayonDetailViewController.swift
//  AC-iOS-Unit2Final
//
//  Created by Marty Hernandez Avedon on 02/14/18.
//  Copyright © 2018 Karen Fuentes. All rights reserved.
//

import UIKit

class CrayonDetailViewController: UIViewController {
    var numberSystem: NumberSystem!
    let hex = Hex()
    let baseTen = BaseTen()
    
    var originalCrayon: Crayon!
    var currentCrayon: Crayon! {
        didSet {
            self.navigationController?.navigationBar.barTintColor = currentCrayon.getUIColor()
            self.navigationController?.navigationBar.tintColor = self.makeTextLegibleOn(red: currentCrayon.cgRed, green: currentCrayon.cgGreen, blue: currentCrayon.cgBlue, alpha: 1.0)
            
            self.view.backgroundColor = currentCrayon.getUIColor()
            self.setLegibleTextColors(for: currentCrayon)
        }
    }
    
    @IBOutlet weak var colorNameLabel: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var baseSwitcher: UISegmentedControl!
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
        
        self.currentCrayon = self.originalCrayon
        self.colorNameLabel.text = self.currentCrayon.name.uppercased()
                
        self.numberSystem = BaseTen()
        
        self.numberSystem.crayonToText(for: (red: self.redField, green: self.greenField, self.blueField, alpha: self.alphaField), crayon: self.currentCrayon)
        
        self.numberSystem.crayonToValue(sliders: (red: self.redSlider, green: self.greenSlider, blue: self.blueSlider), stepper: self.alphaStepper, crayon: self.currentCrayon)
        
        self.setShadows()
    }
    
    // MARK: - Button Actions
    
    @IBAction func resetButtonWasTapped(_ sender: UIButton) {
        self.currentCrayon = self.originalCrayon
        
        self.numberSystem.crayonToText(for: (red: self.redField, green: self.greenField, self.blueField, alpha: self.alphaField), crayon: self.currentCrayon)
        
        self.numberSystem.crayonToValue(sliders: (red: self.redSlider, green: self.greenSlider, blue: self.blueSlider), stepper: self.alphaStepper, crayon: self.currentCrayon)
    }
    
    @IBAction func sliderMoved(_ sender: UISlider) {
        switch sender {
        case self.redSlider:
            self.redField.text = self.numberSystem.textfieldSafe(value: sender.value)
        case self.greenSlider:
            self.greenField.text = self.numberSystem.textfieldSafe(value: sender.value)
        case self.blueSlider:
            self.blueField.text = self.numberSystem.textfieldSafe(value: sender.value)
        default:
            return
        }
        
        self.updateCrayon()
    }
    
    @IBAction func stepperTapped(_ sender: UIStepper) {
        self.alphaField.text = String(sender.value)
        print(sender.value)
        
        self.updateCrayon()
    }
    
    @IBAction func fieldEdited(_ sender: UITextField) {
        guard let userInput = sender.text else {
            return
        }
        
        let newValue = self.numberSystem.validateAndConvert(text: userInput, errorHandler: { (message) in
            let alert = self.numberSystem.errorAlert(with: message)
            
            self.present(alert, animated: true, completion: nil)
            
            return
        })
        
        switch sender {
        case redField:
            self.redSlider.value = newValue!
        case greenField:
            self.greenSlider.value = newValue!
        case blueField:
            self.blueSlider.value = newValue!
        default:
            return
        }
        
        self.updateCrayon()
    }
    
    @IBAction func switchBaseTapped(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            self.numberSystem = self.baseTen
        } else if sender.selectedSegmentIndex == 1 {
            self.numberSystem = self.hex
        }
        
        self.setKeyboards()
        
        self.numberSystem.crayonToText(for: (red: self.redField, green: self.greenField, self.blueField, alpha: self.alphaField), crayon: self.currentCrayon)
    }
}
