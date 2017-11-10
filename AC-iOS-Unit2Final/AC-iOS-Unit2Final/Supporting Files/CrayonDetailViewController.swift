//
//  CrayonDetailViewController.swift
//  AC-iOS-Unit2Final
// 
//  Created by C4Q on 11/10/17.
//  Copyright © 2017 Karen Fuentes. All rights reserved.
//

import UIKit

class CrayonDetailViewController: UIViewController {
   
    //Outlets
    @IBOutlet weak var crayonName: UILabel!
    @IBOutlet weak var redSliderLabel: UILabel!
    @IBOutlet weak var blueSliderLabel: UILabel!
    @IBOutlet weak var greenSliderLabel: UILabel!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var alphaStepper: UIStepper!
    @IBOutlet weak var alphaLabel: UILabel!
    var crayon : Crayon?
    
    
    
    
    
    var red  = CGFloat()
    
    var blue = CGFloat()
    var green = CGFloat()
    
    var alpha = CGFloat()
    
    
    
    
    
    
    
    
    
    
    
    func convertToCGFloatFromDouble (colorValue: Double) -> CGFloat{
        return CGFloat(colorValue / 255)
    }
    func convertToCGFloatFromFloat (colorValue: Float) -> CGFloat{
        return CGFloat(colorValue / 255)
    }
    func convertToFloatForSlider (colorValue: Double) -> Float{
        return Float(colorValue / 255)
    }
    var backgroundColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        crayonName.text = crayon?.name
        redSlider.value = convertToFloatForSlider(colorValue: (crayon?.red)!)
        blueSlider.value = convertToFloatForSlider(colorValue: (crayon?.blue)!)
        greenSlider.value = convertToFloatForSlider(colorValue: (crayon?.green)!)
        redSliderLabel.text = "Red: " + redSlider.value.description
        blueSliderLabel.text = "Blue: " + blueSlider.value.description
        greenSliderLabel.text = "Green: " + greenSlider.value.description
        alphaLabel.text = "Alpha: " + (alphaStepper.value / 10).description
        backgroundColor = UIColor(displayP3Red: convertToCGFloatFromDouble(colorValue: (crayon?.red)!), green: convertToCGFloatFromDouble(colorValue: (crayon?.green)!), blue: convertToCGFloatFromDouble(colorValue: (crayon?.blue)!), alpha: CGFloat(alphaStepper.value))
        view.backgroundColor = backgroundColor
        red = convertToCGFloatFromDouble(colorValue: (crayon?.red)!)
        blue = convertToCGFloatFromDouble(colorValue: (crayon?.blue)!)
        green = convertToCGFloatFromDouble(colorValue: (crayon?.green)!)
        alpha = CGFloat(alphaStepper.value / 10)
        if crayon?.name == "Black"{
            whiteTextForBlack()
        }
        
    }
    
    
    
    
    func whiteTextForBlack(){
        crayonName.textColor = UIColor.white
        blueSliderLabel.textColor = UIColor.white
        redSliderLabel.textColor = UIColor.white
        greenSliderLabel.textColor = UIColor.white
        alphaLabel.textColor = UIColor.white
    }
    
    func blackText(){
        crayonName.textColor = UIColor.black
        blueSliderLabel.textColor = UIColor.black
        redSliderLabel.textColor = UIColor.black
        greenSliderLabel.textColor = UIColor.black
        alphaLabel.textColor = UIColor.black
    }
    
    

    
    //Slider Fun
    
    
    @IBAction func sliderMoved(_ sender: UISlider) {
        switch sender.tag {
        case 0:
            
            
            let colorChanged = CGFloat(sender.value)
            red = colorChanged
            backgroundColor = UIColor(displayP3Red: red, green: green, blue: blue, alpha: alpha)
            redSliderLabel.text = "Red: " + red.description
            view.backgroundColor = backgroundColor
            
            if red <= 0.5 && blue <= 0.5 && green <= 0.5 {
                whiteTextForBlack()
            } else if alpha <= 0.1{
                whiteTextForBlack()
            }else{
                blackText()
            }
        
            
        case 1:
            
            let colorChanged = CGFloat(sender.value)
            blue = colorChanged
            backgroundColor = UIColor(displayP3Red: red , green: green, blue: blue, alpha: alpha)
            blueSliderLabel.text = "Blue: " + blue.description
            view.backgroundColor = backgroundColor
            
             if red <= 0.5 && blue <= 0.5 && green <= 0.5 {
                whiteTextForBlack()
            } else if alpha <= 0.1{
                whiteTextForBlack()
            }else{
                blackText()
            }
         
            
            
        case 2:
            let colorChanged = CGFloat(sender.value)
            green = colorChanged
            backgroundColor = UIColor(displayP3Red: red, green: green, blue: blue, alpha: alpha)
            greenSliderLabel.text = "Green: " + green.description
            view.backgroundColor = backgroundColor
           
            if red <= 0.5 && blue <= 0.5 && green <= 0.5 {
                whiteTextForBlack()
            } else if alpha <= 0.1{
                whiteTextForBlack()
            }else{
                blackText()
            }
            
        default:
           print("Error")
        }
    }
    

    
    
    
    //Stepper Fun

    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        let alphaChanged = CGFloat(sender.value / 10)
        
        alpha = alphaChanged
        backgroundColor = UIColor(displayP3Red: red, green: green, blue: blue, alpha: alpha)
        alphaLabel.text = "Alpha: " + alphaChanged.description
        view.backgroundColor = backgroundColor
        
       
        if alpha <= 0.1 {
            whiteTextForBlack()
        }else if red <= 0.5 && blue <= 0.5 && green <= 0.5{
            whiteTextForBlack()
        }else{
            blackText()
        }
    }
  
 
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        crayonName.text = crayon?.name
        redSlider.value = convertToFloatForSlider(colorValue: (crayon?.red)!)
        blueSlider.value = convertToFloatForSlider(colorValue: (crayon?.blue)!)
        greenSlider.value = convertToFloatForSlider(colorValue: (crayon?.green)!)
        redSliderLabel.text = "Red: " + redSlider.value.description
        blueSliderLabel.text = "Blue: " + blueSlider.value.description
        greenSliderLabel.text = "Green: " + greenSlider.value.description
        alphaLabel.text = "Alpha: " + (alphaStepper.value / 10).description
        backgroundColor = UIColor(displayP3Red: convertToCGFloatFromDouble(colorValue: (crayon?.red)!), green: convertToCGFloatFromDouble(colorValue: (crayon?.green)!), blue: convertToCGFloatFromDouble(colorValue: (crayon?.blue)!), alpha: CGFloat(alphaStepper.value))
        view.backgroundColor = backgroundColor
        red = convertToCGFloatFromDouble(colorValue: (crayon?.red)!)
        blue = convertToCGFloatFromDouble(colorValue: (crayon?.blue)!)
        green = convertToCGFloatFromDouble(colorValue: (crayon?.green)!)
        alpha = CGFloat(alphaStepper.value / 10)
        if crayon?.name == "Black"{
            whiteTextForBlack()
        }else{
            blackText()
        }
        
        
    }
    
    
    
    
    
    
    
    
}
