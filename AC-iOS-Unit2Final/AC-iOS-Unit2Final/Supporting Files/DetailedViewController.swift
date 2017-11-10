//
//  DetailedViewController.swift
//  AC-iOS-Unit2Final
//
//  Created by Richard Crichlow on 11/10/17.
//  Copyright © 2017 Karen Fuentes. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {
    
    //Labels
    @IBOutlet weak var detailedCrayonNameLabel: UILabel!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var alphaLabel: UILabel!
    
    //Actions
    @IBAction func redSliderAction(_ sender: UISlider) {
    }
    @IBAction func greenSliderAction(_ sender: UISlider) {
    }
    @IBAction func blueSliderAction(_ sender: UISlider) {
    }
    @IBAction func alphaStepperAction(_ sender: UIStepper) {
    }
    @IBAction func resetButton(_ sender: UIButton) {
    }
    
    //Outlets
    @IBOutlet weak var redSliderOutlet: UISlider!
    @IBOutlet weak var greenSliderOutlet: UISlider!
    @IBOutlet weak var blueSliderOutlet: UISlider!
    @IBOutlet weak var alphaStepperOutlet: UIStepper!
    @IBOutlet weak var resetButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    

}
