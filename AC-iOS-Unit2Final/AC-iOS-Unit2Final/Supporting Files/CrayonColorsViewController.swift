//
//  CrayonColorsViewController.swift
//  AC-iOS-Unit2Final
//
//  Created by C4Q on 11/10/17.
//  Copyright © 2017 Karen Fuentes. All rights reserved.
//

import UIKit

class CrayonColorsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var crayons = [Crayon]()
//    var myfilteredColors: [Crayon] {
//        let filterName = crayons.filter{$0.name < }
//        return filterName
//    }
    
    @IBOutlet weak var colorTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return crayons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let crayonCell = colorTableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        let currentColor = crayons[indexPath.row]
        
        if let colorCell = crayonCell as? UITableViewCell {
            if currentColor.name == "Black"{
                crayonCell.textLabel?.textColor = UIColor.white
                crayonCell.detailTextLabel?.textColor = UIColor.white
            }
            crayonCell.textLabel?.text = currentColor.name
            crayonCell.detailTextLabel?.text = "Hex Value: \(currentColor.hex)"
            crayonCell.backgroundColor = UIColor(displayP3Red: CGFloat(currentColor.red/255), green: CGFloat(currentColor.green/255), blue: CGFloat(currentColor.blue/255), alpha: 1.0)
            return colorCell
        }
        
        return crayonCell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        colorTableView.dataSource = self
        colorTableView.delegate = self
        crayonSetup()
    }
    
    func crayonSetup() {
       crayons = Crayon.allTheCrayons
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let cell = sender as? UITableViewCell,
            let indexPath = colorTableView.indexPath(for: cell),
            let detailVC = segue.destination as? CrayonDetailViewController
            else { return }
        
        //let season = seasons[indexPath.section]
        let currentColor = crayons[indexPath.row]
//        var alphaVal = 1.0
//        var redVal = currentColor.red/255
//        var greenVal = currentColor.green/255
//        var blueVal = currentColor.blue/255
//        var selectedColor = UIColor(displayP3Red: CGFloat(redVal), green: CGFloat(greenVal), blue: CGFloat(blueVal), alpha: CGFloat(alphaVal))
        
        detailVC.color = currentColor
        
    }

}
