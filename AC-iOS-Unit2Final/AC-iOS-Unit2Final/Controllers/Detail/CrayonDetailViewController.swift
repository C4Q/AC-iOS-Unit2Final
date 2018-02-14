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
            
            // move sliders?
            // change textfield when sliders are moved?
        }
    }
    
    @IBOutlet weak var colorNameLabel: UILabel!
    
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
    }
    
    @IBAction func resetButtonWasTapped(_ sender: UIButton) {
        currentColor = crayon.getUIColor()
        
        // also move sliders back in place
        
        self.redField.placeholder = String((Int(self.crayon.red)))
        self.greenField.placeholder = String(Int((self.crayon.green)))
        self.blueField.placeholder = String((Int(self.crayon.blue)))
        self.alphaField.placeholder = "1.0"
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
    }
    
}
