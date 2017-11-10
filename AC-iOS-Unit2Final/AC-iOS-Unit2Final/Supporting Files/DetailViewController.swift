//
//  DetailViewController.swift
//  AC-iOS-Unit2Final
//
//  Created by C4Q on 11/10/17.
//  Copyright © 2017 Karen Fuentes. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var crayonNameLabel: UILabel!
    @IBOutlet weak var redValTextField: UITextField!
    @IBOutlet weak var greenValTextField: UITextField!
    @IBOutlet weak var blueValTextField: UITextField!
    @IBOutlet weak var alphaValLabel: UILabel!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaStepper: UIStepper!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var formatSegmentedControl: UISegmentedControl!
    
    
    @IBOutlet var labelsCollection: [UILabel]!
    
    
    var selectedCrayon: Crayon?
    var redVal: Double? {
        didSet {
            setUpView()
        }
    }
    var greenVal: Double? {
        didSet {
            setUpView()
        }
    }
    var blueVal: Double? {
        didSet {
            setUpView()
        }
    }
    var alphaVal: Double? {
        didSet {
            setUpView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redValTextField.delegate = self
        greenValTextField.delegate = self
        blueValTextField.delegate = self
        redValTextField.autocapitalizationType = .allCharacters
        greenValTextField.autocapitalizationType = .allCharacters
        blueValTextField.autocapitalizationType = .allCharacters
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        resetPressed(UIButton())
    }
    func setUpView() {
        guard let selectedCrayon = selectedCrayon,
            let redVal = redVal,
            let greenVal = greenVal,
            let blueVal = blueVal,
            let alphaVal = alphaVal else {
                return
        }
        
        crayonNameLabel.text = selectedCrayon.name
        
        if formatSegmentedControl.selectedSegmentIndex == 1 {
            redValTextField.text = String(format: "%02X", Int(redVal * 255))
            greenValTextField.text = String(format: "%02X", Int(greenVal * 255))
            blueValTextField.text = String(format: "%02X", Int(blueVal * 255))
        } else {
            redValTextField.text = String(Int(redVal * 255))
            greenValTextField.text = String(Int(greenVal * 255))
            blueValTextField.text = String(Int(blueVal * 255))
        }
        
        alphaValLabel.text = String(alphaVal)
        
        redSlider.setValue(Float(redVal), animated: true)
        greenSlider.setValue(Float(greenVal), animated: true)
        blueSlider.setValue(Float(blueVal), animated: true)
        alphaStepper.value = alphaVal
        
        
        self.view.backgroundColor = UIColor(red: CGFloat(redVal), green: CGFloat(greenVal), blue: CGFloat(blueVal), alpha: CGFloat(alphaVal))
        guard (redVal + greenVal + blueVal) / 3 < 0.5 || alphaVal < 0.5 else {
            labelsCollection.forEach{$0.textColor = UIColor.black}
            resetButton.setTitleColor(UIColor.black, for: .normal)
            return
        }
        labelsCollection.forEach{$0.textColor = UIColor.white}
        resetButton.setTitleColor(UIColor.white, for: .normal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func resetPressed(_ sender: UIButton) {
        guard let selectedCrayon = selectedCrayon else {
            return
        }
        redVal = selectedCrayon.red / 255
        greenVal = selectedCrayon.green / 255
        blueVal = selectedCrayon.blue / 255
        alphaVal = 1.0
    }
    
    @IBAction func redChange(_ sender: Any) {
        guard let slider = sender as? UISlider else {
            return
        }
        redVal = Double(slider.value)
    }
    @IBAction func greenChange(_ sender: Any) {
        guard let slider = sender as? UISlider else {
            return
        }
        greenVal = Double(slider.value)
    }
    @IBAction func blueChange(_ sender: Any) {
        guard let slider = sender as? UISlider else {
            return
        }
        blueVal = Double(slider.value)
    }
    @IBAction func alphaChange(_ sender: Any) {
        guard let stepper = sender as? UIStepper else {
            return
        }
        
        //correct for floating point errors
        var correctVal = stepper.value
        if Int(correctVal * 1000) % 10 == 9 {
            correctVal = Double(Int(correctVal * 1000) + 1) / 1000
        }
        
        correctVal = Double(Int(correctVal * 1000)) / 1000
        alphaVal = correctVal
    }
    
    //MARK: - Textfield
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard string != "" else {
            return true
        }
        guard string.count == 1 else {
            return false
        }
        let usingDecimal = formatSegmentedControl.selectedSegmentIndex == 0
        guard !(textField.text!.isEmpty && string == "0") else {
            return false
        }
        
        let numbers = usingDecimal ? "1234567890" : "1234567890ABCDEF"
        guard numbers.contains(string) else {
            return false
        }
        
        
        //limit textfield input to be between 0 and 255
        var stringWillBecomeArr = Array(textField.text!)
        stringWillBecomeArr.insert(Character(string), at: range.lowerBound)
        var hexStringAsInt = Int()
        if !usingDecimal {
            hexStringAsInt = Int(String(stringWillBecomeArr), radix: 16)!
        }
        let stringWillBecome = usingDecimal ? String(stringWillBecomeArr) : String(hexStringAsInt)
        
        guard Int(stringWillBecome)! <= 255 else {
            return false
        }
        
        return true
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        //set color values, based on textfield and segcontrol
        if formatSegmentedControl.selectedSegmentIndex == 0 {
            switch textField.tag {
            case 0: redVal = (textField.text?.isEmpty)! ? 0 : Double(textField.text!)! / 255
            case 1: greenVal = (textField.text?.isEmpty)! ? 0 : Double(textField.text!)! / 255
            case 2: blueVal = (textField.text?.isEmpty)! ? 0 : Double(textField.text!)! / 255
            default: print("something went wrong")
            }
        } else {
            switch textField.tag {
            case 0: redVal = (textField.text?.isEmpty)! ? 0 : Double(UInt64(textField.text!, radix:16)!) / 255
            case 1: greenVal = (textField.text?.isEmpty)! ? 0 : Double(UInt64(textField.text!, radix:16)!) / 255
            case 2: blueVal = (textField.text?.isEmpty)! ? 0 : Double(UInt64(textField.text!, radix:16)!) / 255
            default: print("something went wrong")
            }
        }
        return true
    }
    @IBAction func formatSwitched(_ sender: UISegmentedControl) {
        setUpView()
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
