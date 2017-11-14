//
//  DetailViewController.swift
//  AC-iOS-Unit2Final
//
//  Created by Reiaz Gafar on 11/10/17.
//  Copyright © 2017 Karen Fuentes. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var color: Crayon?
    var originalColor: Crayon?
    
    var currentRedVal: Double = 0.5 {
        didSet {
            self.color?.red = currentRedVal * 255
            updateLabelsAndChangeBackgroundColor(color!)
        }
    }
    
    var currentGreenVal: Double = 0.5 {
        didSet {
            self.color?.green = currentGreenVal * 255
            updateLabelsAndChangeBackgroundColor(color!)
        }
    }
    
    var currentBlueVal: Double = 0.5 {
        didSet {
            self.color?.blue = currentBlueVal * 255
            updateLabelsAndChangeBackgroundColor(color!)
        }
    }
    
    
    var currentAlphaValue: Double = 1 {
        didSet {
            if currentAlphaValue >= stepper.maximumValue {
                currentAlphaValue = stepper.maximumValue
            }
            if currentAlphaValue <= stepper.minimumValue {
                currentAlphaValue = stepper.minimumValue
            }
            updateLabelsAndChangeBackgroundColor(color!)
            stepper.value = currentAlphaValue
        }
    }
    
    
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var alphaLabel: UILabel!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var stepper: UIStepper!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let color = color else {
            return
        }
        
        originalColor = Crayon(name: color.name, red: color.red, green: color.green, blue: color.blue, hex: color.hex)
        updateLabelsAndChangeBackgroundColor(originalColor!)

        redSlider.value = Float((originalColor?.red)! / 255)
        greenSlider.value = Float((originalColor?.green)! / 255)
        blueSlider.value = Float((originalColor?.blue)! / 255)
        
    }
    
    
    func setBackgroundColor(_ crayon: Crayon, _ alpha: Double) {
        view.backgroundColor = UIColor(displayP3Red: CGFloat(crayon.red/255), green: CGFloat(crayon.green/255), blue: CGFloat(crayon.blue/255), alpha: CGFloat(alpha))
    }
    
    func changeLabels(_ color: Crayon) {
        colorLabel.text = "\(color.name)"
        redLabel.text = "\(color.red)"
        greenLabel.text = "\(color.green)"
        blueLabel.text = "\(color.blue)"
        alphaLabel.text = "\(currentAlphaValue)"
    }
    
    func changeFontColor(_ color: Crayon) {
        let red = color.red
        let green = color.green
        let blue = color.blue
        
        if (red < 120 && green < 120 && blue < 120) || currentAlphaValue < 0.5 {
            colorLabel.textColor = .white
            redLabel.textColor = .white
            greenLabel.textColor = .white
            blueLabel.textColor = .white
            alphaLabel.textColor = .white
        } else {
            colorLabel.textColor = .black
            redLabel.textColor = .black
            greenLabel.textColor = .black
            blueLabel.textColor = .black
            alphaLabel.textColor = .black
        }
    }
    
    func updateLabelsAndChangeBackgroundColor(_ color: Crayon) {
        setBackgroundColor(color, currentAlphaValue)
        changeLabels(color)
        changeFontColor(color)
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        setBackgroundColor(originalColor!, 1)
        changeLabels(originalColor!)
        redSlider.value = Float((originalColor?.red)! / 255)
        greenSlider.value = Float((originalColor?.green)! / 255)
        blueSlider.value = Float((originalColor?.blue)! / 255)
    }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        currentAlphaValue = sender.value
    }
    
    @IBAction func redSliderMoved(_ sender: UISlider) {
        self.currentRedVal = Double(sender.value)

    }
    
    @IBAction func greenSliderMoved(_ sender: UISlider) {
        self.currentGreenVal = Double(sender.value)

    }
    
    @IBAction func blueSliderMoved(_ sender: UISlider) {
        self.currentBlueVal = Double(sender.value)

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
