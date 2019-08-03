//
//  DetailViewController.swift
//  AC-iOS-Unit2Final
//
//  Created by C4Q on 11/10/17.
//  Copyright © 2017 Karen Fuentes. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var selectedCrayon: Crayon!
    
    @IBOutlet weak var colorNameLabel: UILabel!
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var stepperLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        colorNameLabel.text? = selectedCrayon.name
        self.stepperLabel.text = SetColor.alpha.description
        
        self.redSlider.value = Float(selectedCrayon.red / 255)
        print(SetColor.red)
        redLabel.text = "Red: " + selectedCrayon.red.description
        
        self.greenSlider.value = Float(selectedCrayon.green / 255)
        greenLabel.text = "Green: " + selectedCrayon.green.description
        
        self.blueSlider.value = Float(selectedCrayon.blue / 255)
        blueLabel.text = "Blue: " + selectedCrayon.blue.description
    
        self.colorView.backgroundColor = UIColor(displayP3Red: CGFloat(selectedCrayon.red / 255),
                                                 green: CGFloat(selectedCrayon.green / 255),
                                                 blue: CGFloat(selectedCrayon.blue / 255),
                                                 alpha: 1)
    }

    @IBAction func alphaStepper(_ sender: UIStepper) {
        SetColor.alpha = CGFloat(Double(sender.value))
        stepperLabel.text = SetColor.alpha.description
        
        self.colorView.backgroundColor = UIColor(displayP3Red: CGFloat(selectedCrayon.red / 255),
                                                 green: CGFloat(selectedCrayon.green / 255),
                                                 blue: CGFloat(selectedCrayon.blue / 255),
                                                 alpha: CGFloat(SetColor.alpha))
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        switch sender.tag {
        case 0:
            redLabel.text = "Red: " + String(Int(sender.value * 255))
            SetColor.red = CGFloat(sender.value)
            self.colorView.backgroundColor = UIColor(displayP3Red: CGFloat(sender.value),
                                                     green: CGFloat(SetColor.green),
                                                     blue: CGFloat(SetColor.blue),
                                                     alpha: CGFloat(SetColor.alpha))
        case 1:
            greenLabel.text = "Green: " + String(Int(sender.value * 255))
            SetColor.green = CGFloat(sender.value)
            self.colorView.backgroundColor = UIColor(displayP3Red: CGFloat(SetColor.red),
                                                     green: CGFloat(sender.value),
                                                     blue: CGFloat(SetColor.blue),
                                                     alpha: CGFloat(SetColor.alpha))
        case 2:
            blueLabel.text = "Blue: " + String(Int(sender.value * 255))
            SetColor.blue = CGFloat(sender.value)
            self.colorView.backgroundColor = UIColor(displayP3Red: CGFloat(SetColor.red),
                                                     green: CGFloat(SetColor.green),
                                                     blue: CGFloat(sender.value),
                                                     alpha: CGFloat(SetColor.alpha))
            
        default:
            break
        }
        
        self.colorView.backgroundColor = UIColor(displayP3Red: SetColor.red / 255,
                                                 green: SetColor.green / 255,
                                                 blue: SetColor.blue / 255,
                                                 alpha: CGFloat(SetColor.alpha))
    }
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        setupViews()
        SetColor.alpha = 1
        stepperLabel.text = "\(SetColor.alpha)"
    }
    
    
    

}
