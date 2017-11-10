//
//  DetailedViewController.swift
//  AC-iOS-Unit2Final
//
//  Created by Ashlee Krammer on 11/10/17.
//  Copyright © 2017 Karen Fuentes. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {

    
    var thisCrayon: Crayon!
    
    
    var currentValue: Double = 0 {
        didSet {
            redHueSlider.value = Float(currentValue)
            greenHueSlider.value = Float(currentValue)
            blueHueSlider.value = Float(currentValue)
            currentAlphaStepper.value = Double(currentValue)
            //label.text = "\(currentValue)"
        }
    }
    
    
    //Outlets
    //Labels
    @IBOutlet weak var colorNameLabel: UILabel!
    @IBOutlet weak var redSliderValueLabel: UILabel!
    @IBOutlet weak var greenSliderValueLabel: UILabel!
    @IBOutlet weak var blueSliderValueLabel: UILabel!
    
    //Controls
    @IBOutlet weak var redHueSlider: UISlider!
    @IBOutlet weak var greenHueSlider: UISlider!
    @IBOutlet weak var blueHueSlider: UISlider!
    @IBOutlet weak var currentAlphaStepper: UIStepper!
    @IBOutlet weak var resetButton: UIButton!
    
    
    
    
    //Variables
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorNameLabel.text = thisCrayon.name
        resetButton.isHidden = true
        resetButton.isEnabled = false
    }

    
    
    
    
    
    
    
    
    
    
    
    

}
