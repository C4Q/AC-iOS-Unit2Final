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
            view.backgroundColor = colorBackGround
            redValue.text = "\(SettingColor.redColor)"
            greenValue.text = "\(SettingColor.greenColor)"
            blueValue.text = "\(SettingColor.blueColor)"
            alphaValue.text = "\(SettingColor.alphaColor)"
        }
    }
    
    @IBOutlet weak var crayonName: UILabel!
//    @IBOutlet weak var redValue: UITextField!
//    @IBOutlet weak var greenValue: UITextField!
//    @IBOutlet weak var blueValue: UITextField!
//    @IBOutlet weak var alphaValue: UITextField!
    @IBOutlet weak var redValue: UILabel!
    @IBOutlet weak var greenValue: UILabel!
    @IBOutlet weak var alphaValue: UILabel!
    @IBOutlet weak var blueValue: UILabel!
    
    @IBOutlet weak var sliderRed: UISlider!
    @IBOutlet weak var sliderGreen: UISlider!
    @IBOutlet weak var sliderBlue: UISlider!
    
    @IBOutlet weak var stepperAlpha: UIStepper!
    
    
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
        loadCurrentColor()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadColorLabel()
        view.backgroundColor = colorBackGround
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadCurrentColor()
    }
    
    func loadCurrentColor() {
        guard let unWrappedColor = color else {
            return
        }
        SettingColor.redColor = Double(unWrappedColor.red/255)
        SettingColor.greenColor = Double(unWrappedColor.green/255)
        SettingColor.blueColor = Double(unWrappedColor.blue/255)
        SettingColor.alphaColor = 1.0
        colorBackGround = UIColor(displayP3Red: CGFloat(SettingColor.redColor), green: CGFloat(SettingColor.greenColor), blue: CGFloat(SettingColor.blueColor), alpha: CGFloat(SettingColor.alphaColor))
        loadColorLabel()
    }
    
    func loadColorLabel() {
        crayonName.text = color?.name
        redValue.text = "\(SettingColor.redColor)"
        sliderRed.value = Float(SettingColor.redColor)
        greenValue.text = "\(SettingColor.greenColor)"
        sliderGreen.value = Float(SettingColor.greenColor)
        blueValue.text = "\(SettingColor.blueColor)"
        sliderBlue.value = Float(SettingColor.blueColor)
        alphaValue.text = "\(SettingColor.alphaColor)"
        stepperAlpha.value = SettingColor.alphaColor
    }
    
    
    

}
