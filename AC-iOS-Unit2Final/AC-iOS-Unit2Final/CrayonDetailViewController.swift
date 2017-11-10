//
//  CrayonDetailViewController.swift
//  AC-iOS-Unit2Final
//
//  Created by C4Q on 11/10/17.
//  Copyright © 2017 Karen Fuentes. All rights reserved.
//

import UIKit

class CrayonDetailViewController: UIViewController {

    @IBOutlet weak var crayonName: UILabel!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var myStepper: UIStepper!
    @IBOutlet weak var stepperLabel: UILabel!
    
    var crayon: Crayon? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let crayon = crayon else {
            return
        }
        crayonName.text = crayon.name
        view.backgroundColor = UIColorFromRGB(displayP3Red: crayon.red, green: crayon.green, blue: crayon.blue, alpha: 1.0)
        redSlider.value = Float(crayon.red/255.0)
        greenSlider.value = Float(crayon.green/255.0)
        blueSlider.value = Float(crayon.blue/255.0)
        myStepper.value = 1.0
        redLabel.text = "Red value: \(redSlider.value)"
        greenLabel.text = "Red value: \(greenSlider.value)"
        blueLabel.text = "Red value: \(blueSlider.value)"
        stepperLabel.text = "Step value: \(myStepper.value)"
    }
    func UIColorFromRGB(displayP3Red: Double, green: Double, blue: Double, alpha: Double) -> UIColor {
        return UIColor(
            red: CGFloat(displayP3Red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: CGFloat(alpha)
        )
    }
    @IBAction func sliderDidChange(_ sender: UISlider) {

        switch sender.tag {
        case 0:
            view.backgroundColor = UIColorFromRGB(displayP3Red: Double(sender.value * 255), green: Double(greenSlider.value * 255), blue: Double(blueSlider.value * 255), alpha: myStepper.value)
            redLabel.text = "Red value: \(redSlider.value)"
        case 1:
           view.backgroundColor = UIColorFromRGB(displayP3Red: Double(redSlider.value * 255), green: Double(sender.value * 255), blue: Double(blueSlider.value * 255), alpha: myStepper.value)
            greenLabel.text = "Red value: \(greenSlider.value)"
        case 2:
          view.backgroundColor = UIColorFromRGB(displayP3Red: Double(redSlider.value * 255), green: Double(greenSlider.value * 255), blue: Double(sender.value * 255), alpha: myStepper.value)
            blueLabel.text = "Red value: \(blueSlider.value)"
        default:
            fatalError()
        }
    }

    @IBAction func stepperDidChange(_ sender: UIStepper) {
        view.backgroundColor = UIColorFromRGB(displayP3Red: Double(redSlider.value * 255), green: Double(greenSlider.value * 255), blue: Double(blueSlider.value * 255), alpha: sender.value)
            stepperLabel.text = "Step value: \(myStepper.value)"
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        guard let crayon = crayon else {
            return
        }
        crayonName.text = crayon.name
        view.backgroundColor = UIColorFromRGB(displayP3Red: crayon.red, green: crayon.green, blue: crayon.blue, alpha: 1.0)
        redSlider.value = Float(crayon.red/255.0)
        greenSlider.value = Float(crayon.green/255.0)
        blueSlider.value = Float(crayon.blue/255.0)
        myStepper.value = 1.0
        redLabel.text = "Red value: \(redSlider.value)"
        greenLabel.text = "Red value: \(greenSlider.value)"
        blueLabel.text = "Red value: \(blueSlider.value)"
        stepperLabel.text = "Step value: \(myStepper.value)"
     
    }
}
