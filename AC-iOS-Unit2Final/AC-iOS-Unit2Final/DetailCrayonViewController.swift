//
//  DetailCrayonViewController.swift
//  AC-iOS-Unit2Final
//
//  Created by C4Q on 11/10/17.
//  Copyright © 2017 Karen Fuentes. All rights reserved.
//

import UIKit

class DetailCrayonViewController: UIViewController {

    var color: Crayon?
    var colorBackGround: UIColor = .brown {
        didSet{
            loadColorLabel()
            let setColor = UIColor(displayP3Red: abs(CGFloat(1.0 - (SettingColor.redColor * SettingColor.alphaColor))), green: abs(CGFloat(1.0 - (SettingColor.greenColor * SettingColor.alphaColor))), blue: abs(CGFloat(1.0 - (SettingColor.blueColor * SettingColor.alphaColor))), alpha: 1.0)
            redValue.textColor = setColor
            greenValue.textColor = setColor
            blueValue.textColor = setColor
            alphaValue.textColor = setColor
            buttonReset.tintColor = setColor
            sliderRed.tintColor = setColor
            sliderGreen.tintColor = setColor
            sliderBlue.tintColor = setColor
            
            crayonName.textColor = setColor
            redLabel.textColor = setColor
            greenLabel.textColor = setColor
            blueLabel.textColor = setColor
            alphaLabel.textColor = setColor
        }
    }
    
    @IBOutlet weak var crayonName: UILabel!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var alphaLabel: UILabel!
    
    @IBOutlet weak var redValue: UILabel!
    @IBOutlet weak var greenValue: UILabel!
    @IBOutlet weak var blueValue: UILabel!
    @IBOutlet weak var alphaValue: UILabel!
    
    @IBOutlet weak var sliderRed: UISlider!
    @IBOutlet weak var sliderGreen: UISlider!
    @IBOutlet weak var sliderBlue: UISlider!
    
    @IBOutlet weak var stepperAlpha: UIStepper!
    
    @IBOutlet weak var buttonReset: UIButton!
    
    @IBAction func sliderChangingColor(_ sender: UISlider) {
        switch sender.tag {
        case 1:
            SettingColor.redColor = Double(sender.value)
        case 2:
            SettingColor.greenColor = Double(sender.value)
        case 3:
            SettingColor.blueColor = Double(sender.value)
        default:
            break
        }
        colorBackGround = UIColor(displayP3Red: CGFloat(SettingColor.redColor), green: CGFloat(SettingColor.greenColor), blue: CGFloat(SettingColor.blueColor), alpha: CGFloat(SettingColor.alphaColor))
    }
    
    @IBAction func stepperAlpha(_ sender: UIStepper) {
        SettingColor.alphaColor = Double(sender.value)
        colorBackGround = UIColor(displayP3Red: CGFloat(SettingColor.redColor), green: CGFloat(SettingColor.greenColor), blue: CGFloat(SettingColor.blueColor), alpha: CGFloat(SettingColor.alphaColor))
    }
    
    
    @IBAction func resetButton(_ sender: UIButton) {
        loadOriginalColor()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadOriginalColor()
//        view.backgroundColor = colorBackGround
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadOriginalColor()
    }
    
    func loadOriginalColor() {
        guard let unWrappedColor = color else {
            return
        }
        SettingColor.redColor = Double(unWrappedColor.red/255)
        SettingColor.greenColor = Double(unWrappedColor.green/255)
        SettingColor.blueColor = Double(unWrappedColor.blue/255)
        SettingColor.alphaColor = 1.0
        colorBackGround = UIColor(displayP3Red: CGFloat(SettingColor.redColor), green: CGFloat(SettingColor.greenColor), blue: CGFloat(SettingColor.blueColor), alpha: CGFloat(SettingColor.alphaColor))
    }
    
    func loadColorLabel() {
        crayonName.text = color?.name
        redValue.text = "\(Int(SettingColor.redColor * 255))"
        sliderRed.value = Float(SettingColor.redColor)
        greenValue.text = "\(Int(SettingColor.greenColor * 255))"
        sliderGreen.value = Float(SettingColor.greenColor)
        blueValue.text = "\(Int(SettingColor.blueColor * 255))"
        sliderBlue.value = Float(SettingColor.blueColor)
        alphaValue.text = "\(SettingColor.alphaColor)"
        stepperAlpha.value = SettingColor.alphaColor
        view.backgroundColor = colorBackGround
    }
    
    
    

}
