//
//  DetailViewController.swift
//  AC-iOS-Unit2Final
//
//  Created by C4Q on 11/10/17.
//  Copyright © 2017 Karen Fuentes. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var alphaStepper: UIStepper!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    @IBOutlet weak var crayonNameTextLabel: UILabel!
    @IBOutlet var sliders: [UISlider]!
    @IBOutlet var textLabels: [UILabel]!
    
    
    
    var crayon: Crayon? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard crayon != nil else {
            return
        }
        crayonNameTextLabel.text = crayon?.name
        chosenCrayon()
        changeBackgroundColor()
        lightenLabels()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        chosenCrayon()
    }
    
    
    
    
    //Slider Settings
    
    var currentBackgroundColor = UIColor()
    
    
    func changeBackgroundColor () {
        currentBackgroundColor = UIColor(displayP3Red: Settings.red, green: Settings.green, blue: Settings.blue, alpha: Settings.alpha)
        self.view.backgroundColor = currentBackgroundColor
    }
    
    
    
    //Wanted to put sliders in one similar function
    @IBAction func redSliderMoved(_ sender: UISlider) {
        Settings.red = CGFloat((sender.value))
        changeBackgroundColor()
        lightenLabels()
    }
    
    
    @IBAction func greenSliderMoved(_ sender: UISlider) {
        Settings.green = CGFloat(sender.value)
        changeBackgroundColor()
        lightenLabels()
    }
    
    
    @IBAction func blueSliderMoved(_ sender: UISlider) {
        Settings.blue = CGFloat(sender.value)
        changeBackgroundColor()
        lightenLabels()
    }
    
    
    @IBAction func alphaSlidermoved(_ sender: UISlider) {
        Settings.alpha = CGFloat(sender.value)
        alphaStepper.value = Double(Settings.alpha)
        changeBackgroundColor()
        lightenLabels()
    }
    
    
    //    Stepper Settings
    var alphaStepperNumber: Float = Float(Settings.alpha) {
        didSet {
            alphaStepper.maximumValue  = 1.0
            alphaStepper.minimumValue = 0.0
            if alphaStepperNumber > Float(alphaStepper.maximumValue) {
                alphaStepperNumber = Float(alphaStepper.maximumValue)
            }
            if alphaStepperNumber < Float(alphaStepper.minimumValue) {
                alphaStepperNumber = Float(alphaStepper.minimumValue)
            }
            alphaStepper.value = Double(alphaStepperNumber)
        }
    }
    
    
    @IBAction func alphaStepperPressed(_ sender: UIStepper) {
        alphaStepperNumber = Float(sender.value)
        Settings.alpha = CGFloat(alphaStepperNumber)
        alphaSlider.value = Float(Settings.alpha)
        changeBackgroundColor()
        lightenLabels()
        
    }
    
    
    //Reset Button Settings
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        chosenCrayon()
        lightenLabels()
    }
    
    
    func chosenCrayon () {
        if let crayon = crayon {
            redSlider.value = Float((crayon.red)/255.0)
            blueSlider.value = Float((crayon.blue)/255.0)
            greenSlider.value = Float((crayon.green)/255.0)
            alphaSlider.value = 1.0
        }
        
        Settings.blue = CGFloat((crayon?.blue)!/255.0)
        Settings.green = CGFloat((crayon?.green)!/255.0)
        Settings.red = CGFloat((crayon?.red)!/255.0)
        Settings.alpha = 1
        
        self.view.backgroundColor = UIColor(displayP3Red: CGFloat((crayon?.red)!/255.0), green: CGFloat((crayon?.green)!/255.0), blue: CGFloat((crayon?.blue)!/255.0), alpha: 1)
    }
    
    
    
    func lightenLabels () {
        var alphaWhite = Settings.alpha <= 0.5
        var whiteColorLabels = redSlider.value <= 0.5 && greenSlider.value <= 0.5 && blueSlider.value <= 0.5
        func makeWhite() {
            for slider in sliders {
                slider.thumbTintColor = UIColor.white
            }
            for textLabel in textLabels {
                textLabel.textColor = UIColor.white
            }
            resetButton.tintColor = UIColor.white
            alphaStepper.tintColor = UIColor.white
        }
        if alphaWhite {
            makeWhite()
        }
        else if whiteColorLabels {
            makeWhite()
        }
        else {
            for slider in sliders {
                slider.thumbTintColor = UIColor.black
            }
            for textLabel in textLabels {
                textLabel.textColor = UIColor.black
            }
            resetButton.tintColor = UIColor.black
            alphaStepper.tintColor = UIColor.black
        }
    }
    

    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
