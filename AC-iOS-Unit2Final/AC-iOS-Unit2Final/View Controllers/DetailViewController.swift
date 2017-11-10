//
//  DetailViewController.swift
//  AC-iOS-Unit2Final
//
//  Created by C4Q on 11/10/17.
//  Copyright © 2017 Karen Fuentes. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var color: Crayon? = nil
    
    @IBOutlet weak var viewBg: UIView!
    
    @IBOutlet weak var crayonName: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var redLabel: UILabel!
    
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var greenLabel: UILabel!
    
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var blueLabel: UILabel!
    

    @IBOutlet weak var alphaStepper: UIStepper!
    @IBOutlet weak var alphaLabel: UILabel!
    
    @IBOutlet weak var resetButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpViews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        // Do any additional setup after loading the view.
    }

    func setUpViews() {
        guard let selectedColor = color else {
            return
        }
        self.crayonName.text = selectedColor.name
        
        self.redSlider.value = Float(selectedColor.red / 255)
        redLabel.text = "Red: " + self.redSlider.value.description
        
        self.greenSlider.value = Float(selectedColor.green / 255)
        greenLabel.text = "Green: " + self.greenSlider.value.description
        
        self.blueSlider.value = Float(selectedColor.blue / 255)
        blueLabel.text = "Blue: " + self.blueSlider.value.description
        
        self.alphaStepper.value = Double(Settings.alphaNum)
        alphaLabel.text = "Alpha: " + "\(Settings.alphaNum)"
        
        self.viewBg.backgroundColor = UIColor(displayP3Red: CGFloat(self.redSlider.value), green: CGFloat(self.greenSlider.value), blue: CGFloat(self.blueSlider.value), alpha: CGFloat(self.alphaStepper.value))
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        switch sender.tag {
        case 0:
            self.redSlider.value = sender.value
            Settings.cellColor.red = CGFloat(sender.value)
            redLabel.text = "Red: " + String(sender.value)
        case 1:
            self.greenSlider.value = sender.value
            Settings.cellColor.green = CGFloat(sender.value)
            greenLabel.text = "Green: " + String(sender.value)
        case 2:
            self.blueSlider.value = sender.value
            Settings.cellColor.blue = CGFloat(sender.value)
            blueLabel.text = "Blue: " + String(sender.value)
        default:
            break
        }
        self.viewBg.backgroundColor = UIColor(displayP3Red: CGFloat(self.redSlider.value), green: CGFloat(self.greenSlider.value), blue: CGFloat(self.blueSlider.value), alpha: CGFloat(self.alphaStepper.value))
    }
    
    
    @IBAction func alphaStepperPressed(_ sender: UIStepper) {
        self.alphaStepper.value = sender.value
        alphaLabel.text = "Alpha: " + String(sender.value)
    }
    
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        setUpViews()
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
