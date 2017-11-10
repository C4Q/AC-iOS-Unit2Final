//
//  CrayonDetailViewController.swift
//  AC-iOS-Unit2Final
//
//  Created by Clint Mejia on 11/10/17.
//  Copyright © 2017 Karen Fuentes. All rights reserved.
//

import UIKit

class CrayonDetailViewController: UIViewController {
    
    var selectedCrayon: Crayon? = nil
    
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaStepper: UIStepper!
    
    @IBOutlet weak var colorNameLabel: UILabel!
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!
    @IBOutlet weak var alphaValueLabel: UILabel!
    @IBOutlet weak var hexToDeciLabel: UILabel!
    
    var redValue: CGFloat = 0.0 {
        didSet {
            redValueLabel.text = "Red value: \(redValue)"
        }
    }
    
    var greenValue: CGFloat = 0.0 {
        didSet {

            greenValueLabel.text = "Green value: \(greenValue)"
        }
    }
    
    var blueValue: CGFloat = 0.0 {
        didSet {
            blueValueLabel.text = "Blue value: \(blueValue)"
        }
    }
    
    var alphaValue: CGFloat = 0.0 {
        didSet {
            alphaValueLabel.text = "Alpha Value: \(alphaValue)"
        }
    }
    
    @IBAction func greenSliderChanged(_ sender: UISlider) {
        greenValue = CGFloat(sender.value)
        displayColors()
    }
    
    @IBAction func redSliderChanged(_ sender: UISlider) {
        redValue = CGFloat(sender.value)
        displayColors()
    }
    
    @IBAction func blueSliderChanged(_ sender: UISlider) {
        blueValue = CGFloat(sender.value)
        displayColors()
    }
    
    @IBAction func alphaStepperPressed(_ sender: UIStepper) {
        alphaValue = CGFloat(sender.value)
        displayColors()
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        setupInitialView()
    }
    
    @IBAction func hexToDeciSegChanged(_ sender: UISegmentedControl) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func setupInitialView() {
        guard let selectedCrayon = selectedCrayon else {
            return
        }
        if selectedCrayon.name == "Black" {
            colorNameLabel.textColor = UIColor.white
            redValueLabel.textColor = UIColor.white
            greenValueLabel.textColor = UIColor.white
            blueValueLabel.textColor = UIColor.white
            alphaValueLabel.textColor = UIColor.white
        }
        view.backgroundColor = UIColor(displayP3Red: CGFloat(selectedCrayon.red / 255), green: CGFloat(selectedCrayon.green / 255 ), blue: CGFloat(selectedCrayon.blue / 255), alpha: CGFloat(1.0))
        redValue = CGFloat(selectedCrayon.red / 255)
        redSlider.value = Float(selectedCrayon.red / 255)
        greenValue = CGFloat(selectedCrayon.green / 255)
        greenSlider.value = Float(selectedCrayon.green / 255)
        blueValue = CGFloat(selectedCrayon.blue / 255)
        blueSlider.value = Float(selectedCrayon.blue / 255)
        alphaValue = CGFloat(1.0)
        alphaStepper.value = Double(1.0)
        colorNameLabel.text = "Color chosen: \(selectedCrayon.name)"
        redValueLabel.text = String(selectedCrayon.red / 255)
        greenValueLabel.text = String(selectedCrayon.green / 255)
        blueValueLabel.text = String(selectedCrayon.blue / 255)
        alphaValueLabel.text = String(describing: CGFloat(1.0))
    }
    
    func displayColors() {
        view.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: alphaValue)
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


