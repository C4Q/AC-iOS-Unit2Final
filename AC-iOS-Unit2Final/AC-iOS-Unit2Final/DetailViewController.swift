//
//  DetailViewController.swift
//  AC-iOS-Unit2Final
//
//  Created by C4Q on 11/10/17.
//  Copyright © 2017 Karen Fuentes. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var alphaLabel: UILabel!
    @IBOutlet weak var alphaStepper: UIStepper!
    @IBOutlet weak var crayonName: UILabel!
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var redValueSlider: UISlider!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var greenValueSlider: UISlider!
    @IBOutlet weak var blueValueLabel: UILabel!
    @IBOutlet weak var blueValueSlider: UISlider!
    
   
    var myCrayon: Crayon?

    
    
    func setup() {
        let redColor = CGFloat((myCrayon?.red)!/255)
        let greenColor = CGFloat((myCrayon?.green)!/255)
        let blueColor = CGFloat((myCrayon?.blue)!/255)
        crayonName.text = myCrayon?.name
        redValueLabel.text = "red: \(redColor)"
        greenValueLabel.text = "green: \(greenColor)"
        blueValueLabel.text = "blue:\(blueColor)"
        view.backgroundColor = UIColor(displayP3Red: redColor, green: greenColor, blue: blueColor, alpha: 1)
        
        
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    
    }


}
