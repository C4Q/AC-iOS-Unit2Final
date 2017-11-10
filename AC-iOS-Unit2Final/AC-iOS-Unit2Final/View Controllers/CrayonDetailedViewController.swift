//
//  CrayonDetailedViewController.swift
//  AC-iOS-Unit2Final
//
//  Created by Luis Calle on 11/10/17.
//  Copyright © 2017 Karen Fuentes. All rights reserved.
//

import UIKit

class CrayonDetailedViewController: UIViewController {
    
    @IBOutlet weak var crayonName: UILabel!
    
    @IBOutlet weak var redSliderLabel: UILabel!
    @IBOutlet weak var greenSliderLabel: UILabel!
    @IBOutlet weak var blueSliderLabel: UILabel!
    @IBOutlet weak var alphaStepperLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var alphaStepper: UIStepper!
    
    var currentRedSliderValue: Float = 0 {
        didSet {
            self.redSliderLabel.text = "red: \(currentRedSliderValue)"
            view.backgroundColor = UIColor(displayP3Red: CGFloat(currentRedSliderValue), green: CGFloat(currentGreenSliderValue), blue: CGFloat(currentBlueSliderValue), alpha: CGFloat(currentAlphaStepperValue))
        }
    }
    
    var currentGreenSliderValue: Float = 0 {
        didSet {
            self.greenSliderLabel.text = "green: \(currentGreenSliderValue)"
            view.backgroundColor = UIColor(displayP3Red: CGFloat(currentRedSliderValue), green: CGFloat(currentGreenSliderValue), blue: CGFloat(currentBlueSliderValue), alpha: CGFloat(currentAlphaStepperValue))
        }
    }
    
    var currentBlueSliderValue: Float = 0 {
        didSet {
            self.blueSliderLabel.text = "blue: \(currentBlueSliderValue)"
            view.backgroundColor = UIColor(displayP3Red: CGFloat(currentRedSliderValue), green: CGFloat(currentGreenSliderValue), blue: CGFloat(currentBlueSliderValue), alpha: CGFloat(currentAlphaStepperValue))
        }
    }
    
    var currentAlphaStepperValue: Double = 1 {
        didSet {
            self.alphaStepperLabel.text = "alpha: \(currentAlphaStepperValue)"
            view.backgroundColor = UIColor(displayP3Red: CGFloat(currentRedSliderValue), green: CGFloat(currentGreenSliderValue), blue: CGFloat(currentBlueSliderValue), alpha: CGFloat(currentAlphaStepperValue))
        }
    }
    
    var crayon: Crayon?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let crayon = crayon else {
            return
        }
        crayonName.text = crayon.name
        if crayon.hex == "#000000" {
            changeFontColorToWhite()
        }
        showOriginalCrayonView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func redSliderMoved(_ sender: UISlider) {
        self.currentRedSliderValue = sender.value
    }
    
    @IBAction func greenSliderMoved(_ sender: UISlider) {
        self.currentGreenSliderValue = sender.value
    }
    
    @IBAction func blueSliderMoved(_ sender: UISlider) {
        self.currentBlueSliderValue = sender.value
    }
    
    @IBAction func alphaStepperPressed(_ sender: UIStepper) {
        self.currentAlphaStepperValue = sender.value
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        showOriginalCrayonView()
    }
    
    func showOriginalCrayonView() {
        guard let crayon = crayon else {
            return
        }
        let redVal = crayon.red / 255
        let greenVal = crayon.green / 255
        let blueVal = crayon.blue / 255
        redSlider.value = Float(redVal)
        greenSlider.value = Float(greenVal)
        blueSlider.value = Float( blueVal)
        self.currentRedSliderValue = Float(redVal)
        self.currentGreenSliderValue = Float(greenVal)
        self.currentBlueSliderValue = Float(blueVal)
        alphaStepper.value = 1.0
        self.currentAlphaStepperValue = 1.0
    }
    
    func changeFontColorToWhite() {
        crayonName.textColor = .white
        redSliderLabel.textColor = .white
        greenSliderLabel.textColor = .white
        blueSliderLabel.textColor = .white
        alphaStepperLabel.textColor = .white
    }
    
}
