//
//  ColorDetailViewController.swift
//  AC-iOS-Unit2Final
//
//  Created by C4Q on 11/10/17.
//  Copyright © 2017 Karen Fuentes. All rights reserved.
//

import UIKit

class ColorDetailViewController: UIViewController {
    
    @IBOutlet weak var colorName: UILabel!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet var allSliders: [UISlider]!
    
    @IBOutlet weak var stepperLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var greenLabel: UILabel!
    
    @IBOutlet weak var stepper: UIStepper!
    
    struct CurrentColor {
    var red: Double = 0
    var green: Double = 0
    var blue: Double = 0
    var alpha: Double = 1
    }
    
    var currentColor = CurrentColor() {
        didSet {
            self.view.backgroundColor = UIColor(red: CGFloat(currentColor.red), green: CGFloat(currentColor.green), blue: CGFloat(currentColor.blue), alpha: CGFloat(currentColor.alpha))
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //setToOriginal func call it here 
        colorName.text = crayon?.name
        setBackGroundColor()
        

    }
    var crayon: Crayon!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   // func setToOriginal and put it in reset
    func setBackGroundColor() {
        self.currentColor = CurrentColor(red: Double(crayon.red/255), green: Double(crayon.green/255), blue: Double(crayon.blue/255), alpha: 1)
        allSliders[0].value = Float(currentColor.red)
        allSliders[1].value = Float(currentColor.blue)
        allSliders[2].value = Float(currentColor.green)
       stepper.value = 100
       stepperLabel.text = String(stepper.value)
       redLabel.text = String(currentColor.red)
       blueLabel.text = String(currentColor.blue)
       greenLabel.text = String(currentColor.green)
    }

    
    // Mark - Actions
    @IBAction func redSlidder(_ sender: UISlider) {
       let currentValue = sender.value
        currentColor.red = Double(currentValue)
        redLabel.text = String(currentValue)
    }
    @IBAction func blueSlidder(_ sender: UISlider) {
        let currentValue = sender.value
        currentColor.blue = Double(currentValue)
        blueLabel.text = String(currentValue)
    }
    
    @IBAction func greenSlidder(_ sender: UISlider) {
        let currentValue = sender.value
        currentColor.green = Double(currentValue)
        greenLabel.text = String(currentValue)
//
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        setBackGroundColor()
    }
    @IBAction func stepper(_ sender: UIStepper) {
        let currentValue = Double(sender.value)/100
        currentColor.alpha = currentValue
     stepperLabel.text = String(currentValue)
        
    }
}











////    let currentColor: (red: Double, green: Double, blue: Double, alpha: Double)!   //{
//        didSet {
//self.view.backgroundColor = UIColor(dispalyP3Red: CGFloat(currentColor.red), green: CGFloat(currentColor.green etc
//for label do the same thing but instead of float just do string also make a func for both and then put it in did set .also for label its label.text = string(currentColor.red) etc
//set sliders
//   for sliders in allSliders {
//            switch slider.tag {
//            case 0:
//                slider.value = Float(currentColor.red)
// case 1:
// slider.value = Float(currentColor.green)
//          // case 2:
//    slider.value = Float(currentColor.blue)
//            default:
//            break
//            }
//            //set slider labels
//        }
//    }
// func setBackGroundColor() {
