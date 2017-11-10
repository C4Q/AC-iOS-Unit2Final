//
//  DetailViewController.swift
//  AC-iOS-Unit2Final
//
//  Created by Maryann Yin on 11/10/17.
//  Copyright © 2017 Karen Fuentes. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var crayonColorCluster: Crayon?
    
    @IBOutlet weak var currentColorLabel: UILabel!
    
    @IBOutlet weak var redValueLabel: UILabel!
    
    @IBAction func redValueSlider(_ sender: UISlider) {
        self.currentValue = Double(sender.value)
    }
    
    @IBOutlet weak var greenValueLabel: UILabel!
    
    @IBAction func greenValueSlider(_ sender: UISlider) {
        self.currentValue = Double(sender.value)
    }
    
    @IBOutlet weak var blueValueLabel: UILabel!
    
    @IBAction func blueValueSlider(_ sender: UISlider) {
        self.currentValue = Double(sender.value)
    }
    
    @IBOutlet weak var alphaLabel: UILabel!
    
    @IBAction func alphaStepper(_ sender: UIStepper) {
        self.currentValue = Double(sender.value)
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
    }
    
    var currentValue: Double = 0
//    {
//        didSet {
//            redValueSlider(<#T##sender: UISlider##UISlider#>) = Float(currentValue)
//            greenValueSlider.value = Float(currentValue)
//            blueValueSlider.value = Float(currentValue)
//            alphaStepper.value = Double(currentValue)
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentColorLabel.text = crayonColorCluster!.name
        currentColorLabel.textColor = .white
        redValueLabel.textColor = .white
        greenValueLabel.textColor = .white
        blueValueLabel.textColor = .white
        alphaLabel.textColor = .white
        self.view.backgroundColor = UIColor(displayP3Red: CGFloat(crayonColorCluster!.red/255), green: CGFloat(crayonColorCluster!.green/255), blue: CGFloat(crayonColorCluster!.blue/255), alpha: 1)
        currentValue = 0
    }

}
