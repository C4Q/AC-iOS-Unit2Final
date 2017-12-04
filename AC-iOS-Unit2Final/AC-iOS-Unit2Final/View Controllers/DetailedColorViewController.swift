//
//  DetailedColorViewController.swift
//  AC-iOS-Unit2Final
//
//  Created by Franklin Figueroa on 11/21/17.
//  Copyright © 2017 Karen Fuentes. All rights reserved.

import UIKit
import Foundation

class DetailedColorViewController: UIViewController {
    
    @IBOutlet weak var colorNameLabel: UILabel!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var alphaLabel: UILabel!
    @IBOutlet weak var colorStepper: UIStepper!

    var crayon: Crayon?
    var color: (red: Float, green: Float, blue: Float, alpha: Float)
        = (red: 1, green: 1, blue: 1, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        crayonValueSet()
    }

    func setCrayonBackgroundColor() {
        self.view.backgroundColor = UIColor(displayP3Red: CGFloat(color.red), green: CGFloat(color.green), blue: CGFloat(color.blue), alpha: CGFloat(color.alpha))
    }


    @IBAction func redSlider(_ sender: UISlider) {
        color.red = Float(sender.value)
        redLabel.text = "Red: \(color.red)"
        setCrayonBackgroundColor()
    }

    @IBAction func blueSlider(_ sender: UISlider) {
        color.blue = Float(sender.value)
        blueLabel.text = "Blue: \(color.blue)"
        setCrayonBackgroundColor()
    }

    @IBAction func greenSlider(_ sender: UISlider) {
        color.green = Float(sender.value)
        greenLabel.text = "Green: \(color.green)"
        setCrayonBackgroundColor()
    }

   @IBAction func colorStepper(_ sender: UIStepper) {
        color.alpha = Float(sender.value / 100)
        alphaLabel.text = "Alpha: \(sender.value / 100)"
        setCrayonBackgroundColor()
  }

    @IBAction func resetButton(_ sender: UIButton) {
        crayonValueSet()
    }
    
    func crayonValueSet() {
        guard let crayon = crayon else {
            return
        }
        
        self.color = (red: Float(crayon.red/255), green: Float(crayon.green/255), blue: Float(crayon.blue/255), alpha: 1)
        self.view.backgroundColor = UIColor(red: CGFloat(crayon.red/255), green: CGFloat(crayon.green/255), blue: CGFloat((crayon.blue/255)), alpha: 1)
        self.colorNameLabel.text = crayon.name
        self.redLabel.text = "Red: \(Float(crayon.red/255))"
        self.redSlider.value = Float(crayon.red/255)
        self.blueLabel.text = "Blue: \(Float(crayon.blue/255))"
        self.blueSlider.value = Float(crayon.blue/255)
        self.greenLabel.text = "Green: \(Float(crayon.green/255))"
        self.greenSlider.value = Float(crayon.green/255)
        self.alphaLabel.text = "Alpha: 1"
        
    }
    
}

