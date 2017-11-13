//
//  ColorDetailViewController.swift
//  AC-iOS-Unit2Final
//
//  Created by C4Q on 11/10/17.
//  Copyright © 2017 Karen Fuentes. All rights reserved.
//

import UIKit

class ColorDetailViewController: UIViewController {
    
    @IBOutlet weak var colorName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorName.text = crayon?.name
        let color = UIColor(displayP3Red: CGFloat(crayon.red/255), green: CGFloat(crayon.green/255), blue: CGFloat(crayon.blue/255), alpha: 1)
   self.view.backgroundColor = color
    }
    var crayon: Crayon!

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
}
