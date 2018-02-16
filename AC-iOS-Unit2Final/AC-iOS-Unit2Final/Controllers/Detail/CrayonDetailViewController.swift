//
//  CrayonDetailViewController.swift
//  AC-iOS-Unit2Final
//
//  Created by Marty Hernandez Avedon on 02/14/18.
//  Copyright © 2018 Karen Fuentes. All rights reserved.
//

import UIKit

class CrayonDetailViewController: UIViewController {
    var base = NumberBase.ten
    var originalCrayon: Crayon!
    var currentCrayon: Crayon! {
        didSet {
            self.view.backgroundColor = currentCrayon.getUIColor()
            self.setLegibleTextColors(for: currentCrayon)
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
        
        self.currentCrayon = self.originalCrayon
        
        self.colorNameLabel.text = self.currentCrayon.name
        
        // we will only be using original crayon to reset colors
        
        self.setUpValues(with: currentCrayon)
    }
    
    // MARK: - Button Actions
    
    @IBAction func resetButtonWasTapped(_ sender: UIButton) {
        self.currentCrayon = self.originalCrayon
        
        // also move sliders back in place
        
        self.setUpValues(with: self.currentCrayon)
    }
    
    @IBAction func sliderMoved(_ sender: UISlider) {
        if self.base == NumberBase.ten {
            switch sender {
            case self.redSlider:
                self.redField.text = String(sender.value)
            case self.greenSlider:
                self.greenField.text = String(sender.value)
            case self.blueSlider:
                self.blueField.text = String(sender.value)
            default:
                return
            }
        } else if self.base == NumberBase.hex {
            let intValue = Int(sender.value * 255)
            
            switch sender {
            case self.redSlider:
                self.redField.text = String(intValue, radix: base.rawValue)
            case self.greenSlider:
                self.greenField.text = String(intValue, radix: base.rawValue)
            case self.blueSlider:
                self.blueField.text = String(intValue, radix: base.rawValue)
            default:
                return
            }
        }
        
        self.updateCrayon()
    }
    
    @IBAction func stepperTapped(_ sender: UIStepper) {
        self.alphaField.text = String(sender.value)
        
        self.updateCrayon()
    }
    
    @IBAction func fieldEdited(_ sender: UITextField) {
        guard let userInput = sender.text else {
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
        
        self.updateCrayon()
    }
    
    @IBAction func switchBaseTapped(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            if self.base == NumberBase.hex {
                self.base = NumberBase.ten
            }
        } else if sender.selectedSegmentIndex == 1 {
            if self.base == NumberBase.ten {
                self.base = NumberBase.hex
            } 
        }
        
        self.setUpValues(with: currentCrayon)
    }
}
