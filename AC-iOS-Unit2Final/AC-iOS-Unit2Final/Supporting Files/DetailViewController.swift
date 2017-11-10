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
    
    @IBOutlet weak var redValueSlider: UISlider!
    
    @IBOutlet weak var greenValueLabel: UILabel!
    
    @IBOutlet weak var greenValueSlider: UISlider!
    
    @IBOutlet weak var blueValueLabel: UILabel!
    
    @IBOutlet weak var blueValueSlider: UISlider!
    
    @IBOutlet weak var alphaLabel: UILabel!
    
    @IBOutlet weak var alphaStepper: UIStepper!
    
    @IBAction func resetButton(_ sender: UIButton) {
    }
    
    var currentValue: Double = 0 {
        didSet {
            redValueSlider.value = Float(currentValue)
            greenValueSlider.value = Float(currentValue)
            blueValueSlider.value = Float(currentValue)
            alphaStepper.value = Double(currentValue)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        currentColorLabel.text = crayonColorCluster!.name
    }

}
