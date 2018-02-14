//
//  CrayonTableViewController.swift
//  AC-iOS-Unit2Final
//
//  Created by Marty Hernandez Avedon on 02/14/18.
//  Copyright © 2018 Karen Fuentes. All rights reserved.
//

import UIKit

class CrayonTableViewController: UITableViewController {
    let crayons = Crayon.allTheCrayons
    
    override func viewDidLoad() {
        super.viewDidLoad()

         self.clearsSelectionOnViewWillAppear = false
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.crayons.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifier.crayonCell, for: indexPath) as! UITableViewCell
        let crayon = crayons[indexPath.row]
        
        cell.textLabel?.text = crayon.name
        cell.detailTextLabel?.text = crayon.hex
        
        // color info
        cell.backgroundColor = crayon.getUIColor()
        
        return cell
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == Identifier.segueToDetailScreen else { return }
        
        let nextVC = segue.destination as! CrayonDetailViewController
        let cell = sender as? UITableViewCell
        
        guard let indexPath = tableView.indexPath(for: cell!) else { return }
        
        let selectedCrayon = self.crayons[indexPath.row]
        
        nextVC.crayon = selectedCrayon
        
        // send over color information
                
        nextVC.currentColor = selectedCrayon.getUIColor()
    }
}
