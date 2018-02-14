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
        
        self.redField.placeholder = String((Int(self.crayon.red)))
        self.greenField.placeholder = String(Int((self.crayon.green)))
        self.blueField.placeholder = String((Int(self.crayon.blue)))
        self.alphaField.placeholder = "100"
    }
    
    @IBAction func resetButtonWasTapped(_ sender: UIButton) {
        currentColor = crayon.getUIColor()
        
        // also move sliders back in place
        
        self.redField.placeholder = String((Int(self.crayon.red)))
        self.greenField.placeholder = String(Int((self.crayon.green)))
        self.blueField.placeholder = String((Int(self.crayon.blue)))
        self.alphaField.placeholder = "100"
    }
}
