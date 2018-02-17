//
//  CrayonTableViewCell.swift
//  AC-iOS-Unit2Final
//
//  Created by Marty Hernandez Avedon on 02/17/18.
//  Copyright © 2018 Karen Fuentes. All rights reserved.
//

import UIKit

class CrayonTableViewCell: UITableViewCell {

    @IBOutlet weak var colorName: UILabel!
    @IBOutlet weak var colorHex: UILabel!
    @IBOutlet weak var wrapper: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.wrapper.layer.shadowColor = UIColor.black.cgColor
        self.wrapper.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.wrapper.layer.shadowRadius = CGFloat(2)
        self.wrapper.layer.shadowOpacity = 0.6
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
