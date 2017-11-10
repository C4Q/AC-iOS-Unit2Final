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
    
    @IBOutlet weak var currentColorLabel: UILabel!
    
    @IBOutlet weak var redValueLabel: UILabel!
    
    var currentVal: Double = 0.0 {
        didSet {
            self.view.backgroundColor = UIColor(displayP3Red: CGFloat(crayonColorCluster!.red/255), green: CGFloat(crayonColorCluster!.green/255), blue: CGFloat(crayonColorCluster!.blue/255), alpha: 1.0)
        }
    }
    
    @IBAction func redValueSlider(_ sender: UISlider) {
        self.currentVal = Double(sender.value)
        redValueLabel.text = "Current Red Value: " + String(sender.value)
    }
    
    @IBOutlet weak var greenValueLabel: UILabel!
    
    @IBAction func greenValueSlider(_ sender: UISlider) {
        self.currentVal = Double(sender.value)
//        self.crayonColorCluster!.green = Double(sender.value)
        greenValueLabel.text = "Current Green Value: " + String(sender.value)
    }
    
    @IBOutlet weak var blueValueLabel: UILabel!
    
    @IBAction func blueValueSlider(_ sender: UISlider) {
        self.currentVal = Double(sender.value)
  //      self.crayonColorCluster!.blue = Double(sender.value)
        blueValueLabel.text = "Current Blue Value: " + String(sender.value)
    }
    
    @IBOutlet weak var alphaLabel: UILabel!
    
    @IBAction func alphaStepper(_ sender: UIStepper) {
        alphaLabel.text = "Current Alpha Value: " + String(sender.value)
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        redValueLabel.text = "Current Red Value: " + crayonColorCluster!.red.description
        greenValueLabel.text = "Current Green Value: " + crayonColorCluster!.green.description
        blueValueLabel.text = "Current Blue Value: " + crayonColorCluster!.blue.description
        alphaLabel.text = "Current Alpha Value: " + alphaStepperDefaultValue.description
        self.view.backgroundColor = UIColor(displayP3Red: CGFloat(crayonColorCluster!.red/255), green: CGFloat(crayonColorCluster!.green/255), blue: CGFloat(crayonColorCluster!.blue/255), alpha: 1.0)
    }
    
//    var currentValue: Double = 0
//    {
//        didSet {
//            redValueSlider(<#T##sender: UISlider##UISlider#>) = Float(currentValue)
//            greenValueSlider.value = Float(currentValue)
//            blueValueSlider.value = Float(currentValue)
//            alphaStepper.value = Double(currentValue)
//
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentColorLabel.text = crayonColorCluster!.name
        currentColorLabel.textColor = .white
        redValueLabel.textColor = .white
        redValueLabel.text = "Current Red Value: " + crayonColorCluster!.red.description
        greenValueLabel.textColor = .white
        greenValueLabel.text = "Current Green Value: " + crayonColorCluster!.green.description
        blueValueLabel.textColor = .white
        blueValueLabel.text = "Current Blue Value: " + crayonColorCluster!.blue.description
        alphaLabel.textColor = .white
        alphaLabel.text = "Current Alpha Value: " + alphaStepperDefaultValue.description
        self.view.backgroundColor = UIColor(displayP3Red: CGFloat(crayonColorCluster!.red/255), green: CGFloat(crayonColorCluster!.green/255), blue: CGFloat(crayonColorCluster!.blue/255), alpha: 1)
    }
    
}
