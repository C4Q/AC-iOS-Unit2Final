//
//  DetailViewController.swift
//  AC-iOS-Unit2Final
//
//  Created by C4Q on 11/10/17.
//  Copyright © 2017 Karen Fuentes. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var alphaLabel: UILabel!
    @IBOutlet weak var alphaStepper: UIStepper!
    @IBOutlet weak var crayonName: UILabel!
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var redValueSlider: UISlider!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var greenValueSlider: UISlider!
    @IBOutlet weak var blueValueLabel: UILabel!
    @IBOutlet weak var blueValueSlider: UISlider!
    
   
    var myCrayon: Crayon?
    var currentRed: CGFloat = 0
    var currentGreen: CGFloat = 0
    var currentBlue: CGFloat = 0
    var currentAlpha: CGFloat = 1
    var originalAlpha: CGFloat = 1

    
    
    func setup() {
        currentRed = CGFloat((myCrayon?.red)!/255)
        currentGreen = CGFloat((myCrayon?.green)!/255)
        currentBlue = CGFloat((myCrayon?.blue)!/255)
        crayonName.text = myCrayon?.name
        redValueLabel.text = "red: \(currentRed)"
        greenValueLabel.text = "green: \(currentGreen)"
        blueValueLabel.text = "blue:\(currentBlue)"
        alphaLabel.text = "Alpha: \(currentAlpha)"
        view.backgroundColor = UIColor(displayP3Red: currentRed, green: currentGreen, blue: currentBlue, alpha: 1)
        
    }
    
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        switch sender.tag {
        case 0 :
            currentRed = CGFloat(sender.value)
            redValueLabel.text = "red:" + String(sender.value)
        case 1:
            currentGreen = CGFloat(sender.value)
            greenValueLabel.text = "green:" + String(sender.value)
        case 2:
            currentBlue = CGFloat(sender.value)
            blueValueLabel.text = "blue:" + String(sender.value)
        default :
            break
        }
        view.backgroundColor = UIColor(displayP3Red: currentRed, green: currentGreen, blue: currentBlue, alpha: currentAlpha)
    
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        currentAlpha = CGFloat(sender.value)
        view.backgroundColor = UIColor(displayP3Red: currentRed, green: currentGreen, blue: currentBlue, alpha: currentAlpha)
        alphaLabel.text = "Alpha: \(currentAlpha)"
        
    }
    
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        setup()
        currentAlpha = originalAlpha
        alphaStepper.value = Double(currentAlpha)
        alphaLabel.text = "Alpha: \(currentAlpha)"
    
       
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    
    }


}
