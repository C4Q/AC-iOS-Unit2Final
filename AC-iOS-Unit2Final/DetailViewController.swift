//
//  DetailViewController.swift
//  AC-iOS-Unit2Final
//
//  Created by Masai Young on 11/10/17.
//  Copyright © 2017 Karen Fuentes. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    struct myCrayon {
        var red: CGFloat
        var blue: CGFloat
        var green: CGFloat
        var alpha: CGFloat
        var name: String
    }
    
    // MARK: Crayon Info
    var originalCrayon: Crayon!
    var crayon: myCrayon!
    
    
    // MARK: IBOutlets
    @IBOutlet weak var alphaStepper: UIStepper!
    
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var redSlider: UISlider!
    
    @IBOutlet weak var crayonNameLabel: UILabel!
    @IBOutlet weak var alphaLabel: UILabel!
    @IBOutlet weak var redSliderLabel: UILabel!
    @IBOutlet weak var greenSliderLabel: UILabel!
    @IBOutlet weak var blueSliderLabel: UILabel!
    
    // MARK: IBActions
    @IBAction func alphaStepperPressed(_ sender: UIStepper) {
        crayon.alpha = CGFloat(sender.value / 100)
        alphaLabel.text = "Alpha: \(sender.value / 100)"
        setBGColor()
    }
    
    
    @IBAction func colorChanged(_ sender: UISlider) {
        switch sender.tag {
        case 101:
            crayon.red = CGFloat(sender.value)
            redSliderLabel.text = "red: \(redSlider.value)"
            setBGColor()
        case 102:
            crayon.green = CGFloat(sender.value)
            greenSliderLabel.text = "green: \(greenSlider.value)"
            setBGColor()
        case 103:
            crayon.blue = CGFloat(sender.value)
            blueSliderLabel.text = "blue: \(blueSlider.value)"
            setBGColor()
        default:
            print("Erorr")
        }
    }
    
    @IBAction func resetButton(_ sender: Any) {
        crayon = myCrayon(red: CGFloat(originalCrayon.red/255), blue: CGFloat(originalCrayon.blue/255), green: CGFloat(originalCrayon.green/255), alpha: 1, name: originalCrayon.name)
        setBGColor()
        configureSliders()
        handleTheStepper()
    }
    
    // MARK: Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        setBGColor()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        configureSliders()
        crayonNameLabel.text = crayon.name
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension DetailViewController {
    
    // MARK: - Personal Provate Methods
    private func setBGColor() {
        view.backgroundColor = UIColor(displayP3Red: crayon.red, green: crayon.green, blue:  crayon.blue, alpha: crayon.alpha)
    }
    
    private func configureSliders() {
        redSlider.setValue(Float(crayon.red), animated: true)
        blueSlider.setValue(Float(crayon.blue), animated: true)
        greenSlider.setValue(Float(crayon.green), animated: true)
        redSliderLabel.text = "red: \(redSlider.value)"
        greenSliderLabel.text = "green: \(greenSlider.value)"
        blueSliderLabel.text = "blue: \(blueSlider.value)"
    }
    
    private func handleTheStepper() {
        alphaStepper.value = 100
        alphaLabel.text = "Alpha: \(alphaStepper.value / 100)"
    }
}
