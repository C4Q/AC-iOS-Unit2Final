//
//  CrayonDetailViewController.swift
//  AC-iOS-Unit2Final
//
//  Created by C4Q on 11/10/17.
//  Copyright © 2017 Karen Fuentes. All rights reserved.
//

import UIKit

class CrayonDetailViewController: UIViewController {
    
    var color: Crayon!
    var alphaVal = CGFloat()
    var redVal = CGFloat()
    var greenVal = CGFloat()
    var blueVal = CGFloat()

    @IBOutlet weak var colorNameLabel: UILabel!
    @IBAction func colorResetButton(_ sender: UIButton) {
        loadData()
    }
    //Labels
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var transparencyLabel: UILabel!
    //Sliders
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBAction func colorSliders(_ sender: UISlider) {
        redVal = CGFloat(redSlider.value)
        greenVal = CGFloat(greenSlider.value)
        blueVal = CGFloat(blueSlider.value)
        view.backgroundColor = UIColor(displayP3Red: redVal, green: greenVal, blue: blueVal, alpha: alphaVal)
        switch sender.tag {
        case 0:
            redSlider.value = Float(sender.value)
            redLabel.text = "Red: \(sender.value)"
        case 1:
            greenSlider.value = Float(sender.value)
            greenLabel.text = "Green: \(sender.value)"
        case 2:
            blueSlider.value = Float(sender.value)
            blueLabel.text = "Blue: \(sender.value)"
        default:
            break
        }
    }
    //Stepper
    @IBOutlet weak var alphaStepper: UIStepper!
    @IBAction func stepper(_ sender: UIStepper) {
        alphaVal = CGFloat(sender.value)
        transparencyLabel.text = "Transparency: \(alphaVal)"
        view.backgroundColor = UIColor(displayP3Red: redVal, green: greenVal, blue: blueVal, alpha: alphaVal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }

    func loadData(){
        alphaStepper.value = 1
        let selectedColor = UIColor(displayP3Red: CGFloat(color.red / 255), green: CGFloat(color.green / 255), blue: CGFloat(color.blue / 255), alpha: 1.0)
        colorNameLabel.text = "\(color.name)"
        redLabel.text = "Red: \(color.red / 255)"
        greenLabel.text = "Green : \(color.green / 255)"
        blueLabel.text = "Blue : \(color.blue / 255)"
        transparencyLabel.text = "Transparency: 1.0)"
        view.backgroundColor = selectedColor
        redSlider.value = Float(color.red / 255)
        greenSlider.value = Float(color.green / 255)
        blueSlider.value = Float(color.blue / 255)
        blueVal = CGFloat(color.blue / 255)
        redVal = CGFloat(color.red / 255)
        greenVal = CGFloat(color.green / 255)
        alphaVal = CGFloat(1.0)
    }
}
