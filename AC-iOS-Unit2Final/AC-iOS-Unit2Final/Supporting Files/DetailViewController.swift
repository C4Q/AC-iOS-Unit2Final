//
//  DetailViewController.swift
//  AC-iOS-Unit2Final
//
//  Created by Maryann Yin on 11/10/17.
//  Copyright © 2017 Karen Fuentes. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var crayonColorCluster: Crayon?
    
    var alphaStepperDefaultValue = 1.0
    
    @IBOutlet weak var alphaStepperOutlet: UIStepper!
    
    @IBOutlet weak var currentColorLabel: UILabel!
    
    @IBOutlet weak var redValueLabel: UILabel!
    
    @IBOutlet weak var redSliderOutlet: UISlider!
    
    @IBOutlet weak var greenValueLabel: UILabel!
    
    @IBOutlet weak var greenSliderOutlet: UISlider!
    
    @IBOutlet weak var blueValueLabel: UILabel!
    
    @IBOutlet weak var blueSliderOutlet: UISlider!
    
    @IBAction func sliderAction(sender: AnyObject) {
        self.view.backgroundColor = UIColor(displayP3Red: CGFloat(redSliderOutlet.value/255), green: CGFloat(greenSliderOutlet.value/255), blue: CGFloat(blueSliderOutlet.value/255), alpha: 1)
        redValueLabel.text = "Current Red Value: " + String(Int(redSliderOutlet.value))
        greenValueLabel.text = "Current Green Value: " + String(Int(greenSliderOutlet.value))
        blueValueLabel.text = "Current Blue Value: " + String(Int(blueSliderOutlet.value))
    }
    
    @IBOutlet weak var alphaLabel: UILabel!
    
    @IBAction func alphaStepper(_ sender: UIStepper) {
        alphaLabel.text = "Current Alpha Value: " + String(sender.value)
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        self.view.backgroundColor = UIColor(displayP3Red: CGFloat(crayonColorCluster!.red/255), green: CGFloat(crayonColorCluster!.green/255), blue: CGFloat(crayonColorCluster!.blue/255), alpha: 1)
        redValueLabel.text = "Current Red Value: " + crayonColorCluster!.red.description
        greenValueLabel.text = "Current Green Value: " + crayonColorCluster!.green.description
        blueValueLabel.text = "Current Blue Value: " + crayonColorCluster!.blue.description
        alphaStepperOutlet.value = alphaStepperDefaultValue
        alphaLabel.text = "Current Alpha Value: " + alphaStepperDefaultValue.description
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentColorLabel.text = crayonColorCluster!.name
        currentColorLabel.textColor = .white
        redValueLabel.textColor = .white
        redValueLabel.text = "Current Red Value: " + crayonColorCluster!.red.description
        redSliderOutlet.value = Float(crayonColorCluster!.red/255)
        greenValueLabel.textColor = .white
        greenValueLabel.text = "Current Green Value: " + crayonColorCluster!.green.description
        greenSliderOutlet.value = Float(crayonColorCluster!.green/255)
        blueValueLabel.textColor = .white
        blueValueLabel.text = "Current Blue Value: " + crayonColorCluster!.blue.description
        blueSliderOutlet.value = Float(crayonColorCluster!.blue/255)
        alphaLabel.textColor = .white
        alphaLabel.text = "Current Alpha Value: " + alphaStepperOutlet.value.description
        self.view.backgroundColor = UIColor(displayP3Red: CGFloat(crayonColorCluster!.red/255), green: CGFloat(crayonColorCluster!.green/255), blue: CGFloat(crayonColorCluster!.blue/255), alpha: 1)
    }
    
}
