//
//  detailViewController.swift
//  AC-iOS-Unit2Final
//
//  Created by Lisa J on 11/10/17.
//  Copyright © 2017 Karen Fuentes. All rights reserved.
//

import UIKit

class detailViewController: UIViewController {
    var crayon: Crayon?
    var currentRedVal: Double = 0.5 {
        didSet {
            self.view.backgroundColor = UIColor(displayP3Red: CGFloat(currentRedVal) , green: CGFloat(crayon!.green/255), blue: CGFloat(crayon!.blue/255), alpha: CGFloat(stepperCurrentVal))
        }
    }
    var currentGreenVal: Double = 0.5 {
        didSet {
            self.view.backgroundColor = UIColor(displayP3Red: CGFloat(crayon!.red), green: CGFloat(currentGreenVal), blue: CGFloat(crayon!.blue), alpha: CGFloat(stepperCurrentVal))
        }
    }
    var currentBlueVal: Double = 0.5 {
        didSet {
            self.view.backgroundColor = UIColor(displayP3Red: CGFloat(crayon!.red
            ), green: CGFloat(crayon!.green), blue: CGFloat(currentBlueVal), alpha: CGFloat(stepperCurrentVal))
        }
    }
    var stepperCurrentVal: Double = 1 {
        didSet{
            stepperLabel.text = "alpha: \(stepperCurrentVal)"
            stepper.value = stepperCurrentVal
            
        print(currentRedVal)
        }
    }
    //var currentGreenVal: Double = 0.5
  //  var currentBlueVal: Double
    @IBOutlet weak var sliderRVal: UISlider!
    @IBOutlet weak var sliderGVal: UISlider!
    @IBOutlet weak var sliderBVal: UISlider!
    @IBOutlet weak var colorNameLabel: UILabel!
    @IBOutlet weak var rLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var gLabel: UILabel!
    @IBOutlet weak var stepperLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let crayon = crayon else {
         return
        }
        colorNameLabel.text = crayon.name
        self.view.backgroundColor = UIColor(displayP3Red:CGFloat(crayon.red/255) , green: CGFloat(crayon.green/255), blue: CGFloat(crayon.blue/255), alpha: CGFloat(stepperCurrentVal))
        rLabel.text = "current red val: \(Int(crayon.red))"
        gLabel.text = "current green val: \(Int(crayon.green))"
        bLabel.text = "current blue val: \(Int(crayon.blue))"
        sliderRVal.value = Float(crayon.red/255)// sets initial slider position
        sliderGVal.value = Float(crayon.green/255)
        sliderBVal.value = Float(crayon.blue/255)
        stepperCurrentVal = stepper.value
        stepperLabel.text = "alpha: \(stepperCurrentVal)"
        
        }
    func lighterColors(){
        if currentRedVal < 0.4 || currentGreenVal < 0.4 || stepperCurrentVal < 0.7 {
        rLabel.textColor = UIColor.white
        gLabel.textColor = UIColor.white
        bLabel.textColor = UIColor.white
        stepperLabel.textColor = UIColor.white
        colorNameLabel.textColor = UIColor.white
        }
    }
    
    @IBAction func rSliderValueChanged(_ sender: UISlider) {
        
        self.currentRedVal = Double(sender.value)
        self.rLabel.text = "current red val: \(Int(sender.value*255))"// says slider value is 0-1
        print(stepperCurrentVal)
        lighterColors()
        
    }
    
    @IBAction func gSliderValueChanged(_ sender: UISlider) {
        self.currentGreenVal = Double(sender.value)
        self.gLabel.text = "current green val: \(Int(sender.value*255))"
        lighterColors()
    }
    
    @IBAction func bSliderValueChanged(_ sender: UISlider) {
        self.currentBlueVal = Double(sender.value)
        self.bLabel.text = "current blue val: \(Int(sender.value*255))"
        lighterColors()
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        stepperCurrentVal = sender.value
        if stepperCurrentVal != 0 {
        self.view.backgroundColor = UIColor(displayP3Red: CGFloat(currentRedVal), green: CGFloat(currentGreenVal), blue: CGFloat(currentBlueVal), alpha: CGFloat(stepperCurrentVal))
        }else{
            print("not working")
        }
        if stepperCurrentVal < 0.7  {
            lighterColors()

        }
        
    }
  
   
    @IBAction func resetButton(_ sender: UIButton) {
        self.view.backgroundColor = UIColor(displayP3Red: CGFloat(crayon!.red/255) , green: CGFloat(crayon!.green/255), blue: CGFloat(crayon!.blue/255), alpha: 1)
        rLabel.text = "current red val: \(Int(crayon!.red))"
        gLabel.text = "current green val: \(Int(crayon!.green))"
        bLabel.text = "current blue val: \(Int(crayon!.blue))"
        stepperCurrentVal = 1
        stepper.value = 1
        sliderRVal.value = Float(crayon!.red/255)
        sliderGVal.value = Float(crayon!.green/255)
        sliderBVal.value = Float(crayon!.blue/255)
        rLabel.textColor = UIColor.black
        gLabel.textColor = UIColor.black
        bLabel.textColor = UIColor.black
        stepperLabel.textColor = UIColor.black
        colorNameLabel.textColor = UIColor.black
        print("reset")
    }

}
