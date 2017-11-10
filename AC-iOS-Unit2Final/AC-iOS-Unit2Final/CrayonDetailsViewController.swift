//
//  CrayonDetailsViewController.swift
//  AC-iOS-Unit2Final
//
//  Created by C4Q on 11/10/17.
//  Copyright © 2017 Karen Fuentes. All rights reserved.
//

import UIKit

class CrayonDetailsViewController: UIViewController {

    var selectedCrayon: Crayon?
    
    var currentVal: Double = 1.0 {
        didSet {
            alphaLabel.text = String(currentVal)
            alphaStepper.value = currentVal
//            textField.text = String(Int(currentVal))
        }
    }
    
    @IBOutlet weak var crayonName: UILabel!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var alphaStepper: UIStepper!
    @IBOutlet weak var alphaLabel: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        updateUI()
    }

    @IBAction func sliders(_ sender: UISlider) {
        switch sender.tag {
        case 0:
            Setting.color.red = Double(sender.value)
        case 1:
            Setting.color.green = Double(sender.value)
        case 2:
            Setting.color.blue = Double(sender.value)
        default:
            break
        }
        updateUI()
    }
    
    @IBAction func alphaStepperPressed(_ sender: UIStepper) {
        currentVal = sender.value
        Setting.color.alpha = Float(currentVal)
        updateUI()
    }
    func updateUI() {
        guard let crayon = selectedCrayon else {
            return
        }
        crayonName.text = crayon.name
        self.view.backgroundColor = UIColor(red: CGFloat(Setting.color.red), green: CGFloat(Setting.color.green), blue: CGFloat(Setting.color.blue), alpha: CGFloat(Setting.color.alpha))
        redLabel.text = "Red: \(String(Setting.color.red))"
        greenLabel.text = "Green: \(String(Setting.color.green))"
        blueLabel.text = "Blue: \(String(Setting.color.blue))"
        alphaLabel.text = "Alpha: \(String(currentVal))"
        textLabelChange()
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        currentVal = 1.0
        guard let crayon = selectedCrayon else {
            return
        }
        self.view.backgroundColor = UIColor(red: CGFloat(crayon.red/255.0), green: CGFloat(crayon.green/255.0), blue: CGFloat(crayon.blue/255.0), alpha: CGFloat(currentVal))
        setUp()
        textLabelChange()
    }
    
    func setUp() {
        guard let crayon = selectedCrayon else {
            return
        }
        self.redSlider.value = Float(crayon.red/255.0)
        self.blueSlider.value = Float(crayon.blue/255.0)
        self.greenSlider.value = Float(crayon.green/255.0)
        Setting.color.red = crayon.red/255.0
        Setting.color.green = crayon.green/255.0
        Setting.color.blue = crayon.blue/255.0
        Setting.color.alpha = Float(currentVal)
        redLabel.text = "Red: \(String(crayon.red/255.0))"
        greenLabel.text = "Green: \(String(crayon.green/255.0))"
        blueLabel.text = "Blue: \(String(crayon.blue/255.0))"
        alphaLabel.text = "Alpha: \(String(currentVal))"
    }
    
    func textLabelChange() {
        if Setting.color.red < 0.6 && Setting.color.green < 0.5 && Setting.color.blue < 0.7 || Setting.color.alpha < 0.5 {
            crayonName.textColor = .white
            redLabel.textColor = .white
            greenLabel.textColor = .white
            blueLabel.textColor = .white
            alphaLabel.textColor = .white
            resetButton.setTitleColor(.white, for: .normal)
        } else {
            crayonName.textColor = .black
            redLabel.textColor = .black
            greenLabel.textColor = .black
            blueLabel.textColor = .black
            alphaLabel.textColor = .black
            resetButton.setTitleColor(.black, for: .normal)
        }
    }
}



