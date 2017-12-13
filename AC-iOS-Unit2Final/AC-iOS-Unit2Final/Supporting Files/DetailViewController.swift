//  CrayonsDetailViewController.swift
//  AC-iOS-Unit2Final
//  Created by C4Q on 11/10/17.

import UIKit

class DetailViewController: UIViewController {

	//Outlets
	@IBOutlet var labelGroup: [UILabel]!
	@IBOutlet weak var crayonNameLabel: UILabel!
	@IBOutlet weak var redSlider: UISlider!
	@IBOutlet weak var greenSlider: UISlider!
	@IBOutlet weak var blueSlider: UISlider!
	@IBOutlet weak var alphaStepper: UIStepper!
	@IBOutlet weak var resetButtonLabel: UIButton!
	@IBOutlet weak var redLabel: UILabel!
	@IBOutlet weak var greenLabel: UILabel!
	@IBOutlet weak var blueLabel: UILabel!
	@IBOutlet weak var alphaLabel: UILabel!
	@IBOutlet weak var segmentedControl: UISegmentedControl!
	
	//Variables/Constants
	var crayon: Crayon?
	
	//Actions
	@IBAction func sliderValueChanged(_ sender: UISlider) {
		switch sender.tag {
		case 0:
			ColorTracker.cellColor.red = CGFloat(sender.value)
			if segmentedControl.selectedSegmentIndex == 0 {
				self.redLabel.text = "Red: \(sender.value)"
			} else {
				self.redLabel.text = "Red: \(String(Int(redSlider.value * 255), radix: 16))"
			}
		case 1:
			ColorTracker.cellColor.green = CGFloat(sender.value)
			if segmentedControl.selectedSegmentIndex == 0 {
				self.greenLabel.text = "Green: \(sender.value)"
			} else {
				self.greenLabel.text = "Green: \(String(Int(greenSlider.value * 255), radix: 16))"
			}
		case 2:
			ColorTracker.cellColor.blue = CGFloat(sender.value)
			if segmentedControl.selectedSegmentIndex == 0 {
				self.blueLabel.text = "Blue: \(sender.value)"
			} else {
				self.blueLabel.text = "Blue: \(String(Int(blueSlider.value * 255), radix: 16))"
			}
		default:
			break
		}
		self.view.backgroundColor = UIColor(displayP3Red: ColorTracker.cellColor.red, green: ColorTracker.cellColor.green, blue: ColorTracker.cellColor.blue, alpha: CGFloat(alphaStepper.value))
	}
	
	@IBAction func stepperValueChanged(_ sender: UIStepper) {
		ColorTracker.cellColor.alpha = CGFloat(sender.value)
		self.view.backgroundColor = UIColor(displayP3Red: ColorTracker.cellColor.red, green: ColorTracker.cellColor.green, blue: ColorTracker.cellColor.blue, alpha: CGFloat(alphaStepper.value))
		
		//EXTRA POINTS - Have the Labels change to a lighter color to make it easier to read once the view gets too dark.
		if alphaStepper.value < 0.60 || self.view.backgroundColor == UIColor.black {
			labelGroup.forEach{ label in label.textColor = UIColor.white }
			self.resetButtonLabel.titleLabel?.textColor = UIColor.white
		}
		//Extra point for hexadecimal in segmented control
		if segmentedControl.selectedSegmentIndex == 0 {
			self.alphaLabel.text = "Alpha: \(sender.value)"
		} else {
			self.alphaLabel.text = "Alpha: \(String(Int(alphaStepper.value * 255), radix: 16))"
		}
	}
	
	@IBAction func resetColor(_ sender: UIButton) {
		updateColor()
		labelGroup.forEach{ label in label.textColor = UIColor.black }
		self.resetButtonLabel.titleLabel?.textColor = UIColor.black
	}
	
	//EXTRA POINTS - 	Create a segmented control with two titles "Decimal" and "Hex". If "Decimal" is selected, the labels should all be in decimal between 0 and 1. If "Hex" is selected, the labels should all be in hex between 0 and FF.
	@IBAction func segmentedSwitch(_ sender: UISegmentedControl) {
		switch sender.selectedSegmentIndex {
		case 0:
			self.redLabel.text = "Red: \(redSlider.value)"
			self.greenLabel.text = "Green:  \(greenSlider.value)"
			self.blueLabel.text = "Blue:  \(blueSlider.value)"
			self.alphaLabel.text = "Alpha:  \(alphaStepper.value)"
		case 1:
			self.redLabel.text = "Red: \(String(Int(redSlider.value * 255), radix: 16))"
			self.greenLabel.text = "Green: \(String(Int(greenSlider.value * 255), radix: 16))"
			self.blueLabel.text = "Blue: \(String(Int(blueSlider.value * 255), radix: 16))"
			self.alphaLabel.text = "Alpha: \(String(Int(alphaStepper.value * 255), radix: 16))"
		default:
			break
		}
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
		
		//Extra point: to maintain segmented Control persistence
		if segmentedControl.selectedSegmentIndex == 0 {
			self.redLabel.text = "Red: \(ColorTracker.cellColor.red)"
			self.greenLabel.text = "Green:  \(ColorTracker.cellColor.green)"
			self.blueLabel.text = "Blue:  \(ColorTracker.cellColor.blue)"
			self.alphaLabel.text = "Alpha:  \(ColorTracker.cellColor.alpha)"
		} else {
			self.redLabel.text = "Red: \(String(Int(redSlider.value * 255), radix: 16))"
			self.greenLabel.text = "Green: \(String(Int(greenSlider.value * 255), radix: 16))"
			self.blueLabel.text = "Blue: \(String(Int(blueSlider.value * 255), radix: 16))"
			self.alphaLabel.text = "Alpha: \(String(Int(alphaStepper.value * 255), radix: 16))"
		}
	}	
}

/*
Use TextFields, instead of Labels, to show each RGB value. Typing in a value manually should affect the respective slider's positions and update the background color.
*/
extension DetailViewController: UITextFieldDelegate {
	
	
	func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
		
		
		return true
	}
}
