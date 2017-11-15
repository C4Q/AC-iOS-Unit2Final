//
//  CrayonViewController.swift
//  AC-iOS-Unit2Final
//
//  Created by C4Q on 11/10/17.
//  Copyright © 2017 Karen Fuentes. All rights reserved.
//

import UIKit

class CrayonViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var allTheCrayons = Crayon.allTheCrayons
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        
    }
    
    func convertToCGFloat (colorValue: Double) -> CGFloat{
        return CGFloat(colorValue / 255)
    }
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allTheCrayons.count
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rowToSetUp = indexPath.row
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Crayon Cell"){
            let crayon = allTheCrayons[rowToSetUp]
            
            if crayon.name == "Black"{
                cell.textLabel?.textColor = UIColor.white
                cell.detailTextLabel?.textColor = UIColor.white
            }
            
            
            
            cell.textLabel?.text = crayon.name
            cell.detailTextLabel?.text = crayon.hex
            cell.backgroundColor = UIColor(displayP3Red: convertToCGFloat(colorValue: crayon.red), green: convertToCGFloat(colorValue: crayon.green), blue: convertToCGFloat(colorValue: crayon.blue), alpha: 1)
            
            
            return cell
        }
        return UITableViewCell()
    }
    
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? CrayonDetailViewController{
            let rowToSet = tableView.indexPathForSelectedRow?.row
            let crayon = allTheCrayons[rowToSet!]
            destination.crayon = crayon
        }
        
        
        
    }
    
    
    
    
    
    
    
}
