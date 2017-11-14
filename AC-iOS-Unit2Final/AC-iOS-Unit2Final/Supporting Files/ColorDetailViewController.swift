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
    
    @IBOutlet var allSliders: [UISlider]!
    
    @IBOutlet var allLabels: [UILabel]!
   
    struct CurrentColor {
    var red: Double = 0
    var green: Double = 0
    var blue: Double = 0
    }
    
    var currentColor = CurrentColor() {
        didSet {
            self.view.backgroundColor = UIColor(red: CGFloat(currentColor.red), green: CGFloat(currentColor.green), blue: CGFloat(currentColor.blue), alpha: 1)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //setToOriginal func call it here 
        colorName.text = crayon?.name
        self.currentColor = CurrentColor(red: Double(crayon.red/255), green: Double(crayon.green/255), blue: Double(crayon.blue/255))
        allSliders[0].value = Float(currentColor.red)
        allSliders[1].value = Float(currentColor.blue)
        allSliders[2].value = Float(currentColor.green)

    }
    var crayon: Crayon!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   // func setToOriginal and put it in reset

    @IBAction func redSlidder(_ sender: UISlider) {
       let currentValue = sender.value
        currentColor.red = Double(currentValue)
    }
    @IBAction func blueSlidder(_ sender: UISlider) {
        let currentValue = sender.value
        currentColor.blue = Double(currentValue)
    }
    
    @IBAction func greenSlidder(_ sender: UISlider) {
        let currentValue = sender.value
        currentColor.green = Double(currentValue)
    }
}










//Code for help
 // UIColor(displayP3Red: CGFloat(crayon.red/255), green: CGFloat(crayon.green/255), blue: CGFloat(crayon.blue/255), alpha: 1)
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
// let red = CGFloat(currentColor.red/ 255)
//  self.view.backgroundColor = UIcolor(displayP3Red: red, green: green, blue: blue)
