//
//  DetailViewController.swift
//  AC-iOS-Unit2Final
//
//  Created by C4Q on 11/10/17.
//  Copyright © 2017 Karen Fuentes. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var passedCrayonColor: UIColor?
    var passedCrayonColorName: String?
    

    @IBOutlet weak var selectedCrayonNameLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    
    @IBOutlet weak var greenSlider: UISlider!
    
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var alphaStepper: UIStepper!
    //Labels
    @IBOutlet weak var redValueLabel: UILabel!
    
    @IBOutlet weak var greenValueLabel: UILabel!
    
    @IBOutlet weak var blueValueLabel: UILabel!
    
    @IBOutlet weak var alphaValueLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupValues()
    }
    
    

    func setupValues() {
        self.view.backgroundColor = passedCrayonColor
        //guard let safeCrayon = passedCrayonColorName else { return }
        self.selectedCrayonNameLabel.text = passedCrayonColorName
        //red
        self.redSlider.value = Float(Settings.cellColor.red)
        redValueLabel.text = "Red: " + Settings.cellColor.red.description
        //green
        self.greenSlider.value = Float(Settings.cellColor.green)
        greenValueLabel.text = "Green: " + Settings.cellColor.green.description
        //blue
        self.blueSlider.value = Float(Settings.cellColor.blue)
        blueValueLabel.text = "Blue: " + Settings.cellColor.blue.description
        //stepper value setup
        self.alphaStepper.value = Double(Settings.AlphaStepperValue)
        self.alphaValueLabel.text = "Alpha Value: " + String(Int(Settings.AlphaStepperValue))
        //alphaStepper.maximumValue = 1
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        switch sender.tag {
        case 0:
            Settings.cellColor.red = CGFloat(sender.value)
            redValueLabel.text = "Red: " + String(sender.value)
        case 1:
            Settings.cellColor.green = CGFloat(sender.value)
            greenValueLabel.text = "Green: " + String(sender.value)
       case 2:
           Settings.cellColor.blue = CGFloat(sender.value)
           blueValueLabel.text = "Blue: " + String(sender.value)
        default:
            break
        }
    }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        Settings.AlphaStepperValue = sender.value
        alphaValueLabel.text = "Alpha Value: " + String(Int(sender.value))
    }
    
    @IBAction func resetButtonClicked(_ sender: UIButton) {
    }
    
    
    
    
    func resetAllValues() {
      //sets all the sliders and labels to be the corresponding colors of the Crayon the user selected and resets the alpha to 1.0.
    }
}
