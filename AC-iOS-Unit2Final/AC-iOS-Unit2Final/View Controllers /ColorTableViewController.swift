//
//  ColorTableViewController.swift
//  AC-iOS-Unit2Final
//
//  Created by Ashlee Krammer on 11/10/17.
//  Copyright © 2017 Karen Fuentes. All rights reserved.
//

import UIKit

class ColorTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //Variables
    var crayons = Crayon.allTheCrayons

    
    //Make a var for all background colors
    //var backgroundColor = UIColor(displayP3Red:green:blue:alpha:)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    //Two required functions for Table View Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return crayons.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let aCrayon = crayons[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "crayonCell", for: indexPath)
        cell.textLabel?.text = aCrayon.name
        cell.detailTextLabel?.text = "Color Hex: \(aCrayon.hex)"
        if cell.textLabel!.text == "Black" {
            cell.textLabel?.textColor = .white
            cell.detailTextLabel?.textColor = .white
        }
        cell.backgroundColor = UIColor(displayP3Red: CGFloat(aCrayon.red / 255), green: CGFloat(aCrayon.green / 255), blue: CGFloat(aCrayon.blue / 255), alpha: 1.0)
        return cell
    }
    
    
    
    //Segue to detailed View Controller
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailedViewController {
            let selectedRow = tableView.indexPathForSelectedRow?.row //What row did you select?
            let selectedCrayon = crayons[selectedRow!] //how to get your crayon
            destination.thisCrayon = selectedCrayon
            
        }
        }

}
