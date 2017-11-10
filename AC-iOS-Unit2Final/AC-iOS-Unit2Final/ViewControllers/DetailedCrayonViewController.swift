//
//  DetailedCrayonViewController.swift
//  AC-iOS-Unit2Final
//
//  Created by C4Q on 11/10/17.
//  Copyright © 2017 Karen Fuentes. All rights reserved.
//

import UIKit

class DetailedCrayonViewController: UIViewController {
    
    //labels
    @IBOutlet weak var crayonName: UILabel!
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!
    @IBOutlet weak var alphaLevel: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    
    //sliders and stepper
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaStepper: UIStepper!
    
    var crayon: Crayon? = nil
    
    var redCurrentValue: Float = Settings.redSlider {
        didSet{
            redSlider.value = Float(redCurrentValue)
            redValueLabel.text = "\(redCurrentValue)"
            Settings.redSlider = redCurrentValue
        }
    }
    var greenCurrentValue: Float = Settings.greenSlider {
        didSet{
            greenSlider.value = Float(greenCurrentValue)
            greenValueLabel.text = "\(greenCurrentValue)"
            Settings.greenSlider = greenCurrentValue
        }
    }
    var blueCurrentValue: Float = Settings.blueSlider{
        didSet{
            blueSlider.value = Float(blueCurrentValue)
            blueValueLabel.text = "\(redCurrentValue)"
            Settings.blueSlider = blueCurrentValue
        }
    }
    
    var alphaLevelValue: Float = Settings.alphaStepperLevel {
        didSet{
            alphaStepper.value = Double(Float(alphaLevelValue))
            alphaLevel.text = "\(alphaLevel)"
        }
    }
    
    //Slider Actions
    @IBAction func redSliderMoved(_ sender: UISlider) {
        self.redValueLabel.text = String(Float(sender.value))
    }
    @IBAction func greenSliderMoved(_ sender: UISlider) {
        self.greenValueLabel.text = String(Float(sender.value))
    }
    @IBAction func blueSliderMoved(_ sender: UISlider) {
        self.blueValueLabel.text = String(Float(sender.value))
    }
    
    
    //Stepper Action
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        //stepper = sender.value
    }
    
    //Reset Action
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        reset()
    }
    func reset() {
        redSlider.value = Float((crayon?.red)!)
        greenSlider.value = Float((crayon?.green)!)
        blueSlider.value = Float((crayon?.blue)!)
        redValueLabel.text = "Red Value: \(String((crayon?.red)! / 255))"
        greenValueLabel.text = "Green Value: \(String((crayon?.green)! / 255))"
        blueValueLabel.text = "Blue Value: \(String((crayon?.blue)! / 255))"
        alphaLevel.text = "Alpha Level: \(alphaLevel)"
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let crayon = crayon else {
            return
        }
        //set-up properties of what you want to appear in new VC
        crayonName.text = crayon.name
        redValueLabel.text = "Red Value: \(String(crayon.red / 255))"
        greenValueLabel.text = "Green Value: \(String(crayon.green / 255))"
        blueValueLabel.text = "Blue Value: \(String(crayon.blue / 255))"
        alphaLevel.text = "Alpha Level: \(alphaLevel)"
        view.backgroundColor = UIColor(displayP3Red: CGFloat(crayon.red / 255), green: CGFloat(crayon.green / 255), blue: CGFloat(crayon.blue / 255), alpha:1)
        //showing values on sliders
        redSlider.value = Float(crayon.red)
        greenSlider.value = Float(crayon.green)
        blueSlider.value = Float(crayon.blue)
    }
    
    
    
}


//func viewWillAppear(_ animated: Bool) {
//
//        sliderRedOutlet.value = sliderRedValue
//        sliderGreenOutlet.value = sliderGreenValue
//        sliderBlueOutlet.value = sliderBlueValue
//        //        redCurrentSliderValueForBackgroundColor = Settings.redValueForBackgroundDouble
//        //        greenCurrentSliderValueForBackgroundColor = Settings.greenValueForBackgroundDouble
//        //        blueCurrentSliderValueForBackgroundColor = Settings.blueValueForBackgroundDouble
//    }



