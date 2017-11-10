//
//  DetailsViewController.swift
//  AC-iOS-Unit2Final
//
//  Created by C4Q on 11/10/17.
//  Copyright © 2017 Karen Fuentes. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    var crayon: Crayon?
    var color: (red: Double, green: Double, blue: Double, alpha: Double) = (red: 1, green: 1, blue: 1, alpha: 1)
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var alphaLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var redSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    @IBAction func redSliderValueChanged(_ sender: UISlider) {
        color.red = Double(sender.value)
        redLabel.text = "Red: \(color.red)"
        setBackgroundColor()
    }
    
    @IBAction func greenSldierValueChanged(_ sender: UISlider) {
        color.green = Double(sender.value)
        greenLabel.text = "Green: \(color.green)"
        setBackgroundColor()
    }
    
    @IBAction func blueSliderValueChanged(_ sender: UISlider) {
        color.blue = Double(sender.value)
        blueLabel.text = "Blue: \(color.blue)"
        setBackgroundColor()
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        color.alpha = sender.value
        alphaLabel.text = "Alpha: \(color.alpha)"
        setBackgroundColor()
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
       configure()
    }
    
  
    func setBackgroundColor() {
        self.view.backgroundColor = UIColor(displayP3Red: CGFloat(color.red), green: CGFloat(color.green), blue: CGFloat(color.blue), alpha: CGFloat(color.alpha))
        
    }
    func configure() {
        guard let crayon = crayon else {
            return
        }
        self.color = (red: crayon.red, green: crayon.green, blue: crayon.blue, alpha: 1)
        self.view.backgroundColor = UIColor(displayP3Red: CGFloat(crayon.red/255), green: CGFloat(crayon.green/255), blue: CGFloat((crayon.blue/255)), alpha: 1)
        self.nameLabel.text = crayon.name
        self.redLabel.text = "Red: \(crayon.red/255)"
        self.greenLabel.text = "Green: \(crayon.green/255)"
        self.blueLabel.text = "Blue: \(crayon.blue/255)"
        self.redSlider.value = Float(crayon.red/255)
        self.greenSlider.value = Float(crayon.green/255)
        self.blueSlider.value = Float(crayon.blue/255)
        
        self.alphaLabel.text = "Alpha: 1"
        stepper.value = 1
    }
    
}
