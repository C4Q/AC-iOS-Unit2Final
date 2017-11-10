//  CrayonsDetailViewController.swift
//  AC-iOS-Unit2Final
//  Created by C4Q on 11/10/17.
//  Copyright © 2017 Karen Fuentes. All rights reserved.

import UIKit

class DetailViewController: UIViewController {

	//Outlets
	@IBOutlet weak var crayonNameLabel: UILabel!
	@IBOutlet weak var redSlider: UISlider!
	@IBOutlet weak var greenSlider: UISlider!
	@IBOutlet weak var blueSlider: UISlider!
	@IBOutlet weak var alphaStepper: UIStepper!
	@IBOutlet weak var resetButtonLabel: UIButton!
	
	//Variables/Constants
	var crayon: Crayon?
	
	//Actions
	@IBAction func sliderValueChanged(_ sender: UISlider) {
		switch sender.tag {
		case 0:
			ColorTracker.cellColor.red = CGFloat(sender.value)
		case 1:
			ColorTracker.cellColor.green = CGFloat(sender.value)
		case 2:
			ColorTracker.cellColor.blue = CGFloat(sender.value)
		default:
			break
		}
		self.view.backgroundColor = UIColor(displayP3Red: ColorTracker.cellColor.red, green: ColorTracker.cellColor.green, blue: ColorTracker.cellColor.blue, alpha: CGFloat(alphaStepper.value))
	}
	
	@IBAction func stepperValueChanged(_ sender: UIStepper) {
		ColorTracker.cellColor.alpha = CGFloat(sender.value)
		self.view.backgroundColor = UIColor(displayP3Red: ColorTracker.cellColor.red, green: ColorTracker.cellColor.green, blue: ColorTracker.cellColor.blue, alpha: CGFloat(alphaStepper.value))
	}
	@IBAction func resetColor(_ sender: UIButton) {
		updateColor()
//		resetButtonLabel.setTitleColor(UIColor(crayon?.hex), for: .Normal)
	}
	
	//views
    override func viewDidLoad() {
		super.viewDidLoad()
		updateColor()
    }

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		updateColor()
	}
	
	func updateColor() {
		guard let crayon = crayon else { return }
		self.crayonNameLabel.text = crayon.name
		let red = CGFloat(crayon.red)/255.0
		let green = CGFloat(crayon.green)/255.0
		let blue = CGFloat(crayon.blue)/255.0
		ColorTracker.cellColor = (red, green, blue, 1)
		self.view.backgroundColor = UIColor(displayP3Red: ColorTracker.cellColor.red, green: ColorTracker.cellColor.green, blue: ColorTracker.cellColor.blue, alpha: 1)
		self.redSlider.value = Float(red)
		self.greenSlider.value = Float(green)
		self.blueSlider.value = Float(blue)
	}

}
