//
//  CrayonDetailViewController.swift
//  AC-iOS-Unit2Final
//
//  Created by Marty Hernandez Avedon on 02/14/18.
//  Copyright © 2018 Karen Fuentes. All rights reserved.
//

import UIKit

class CrayonDetailViewController: UIViewController {
    var crayon: Crayon!
    // this start off derived from self.crayon, but then we let the sliders give it values
    var currentColor: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = currentColor
    }
}
