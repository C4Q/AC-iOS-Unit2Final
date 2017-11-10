//
//  CrayonColorsTableViewController.swift
//  AC-iOS-Unit2Final
//
//  Created by C4Q on 11/10/17.
//  Copyright © 2017 Karen Fuentes. All rights reserved.
//

import UIKit

class CrayonColorsTableViewController: UITableViewController {
    var crayonsArr = [Crayon]()
    var valueToPass: UIColor!
    var colorNameToPass: String!
    var redsliderValueToPass: Double!

    override func viewDidLoad() {
        super.viewDidLoad()
        crayonsArr = Crayon.allTheCrayons
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return crayonsArr.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let selectedCrayon = crayonsArr[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ColorCell", for: indexPath)

        cell.textLabel?.text = selectedCrayon.name
        cell.detailTextLabel?.text = selectedCrayon.hex
        cell.backgroundColor = UIColor(red: (CGFloat(selectedCrayon.red))/225, green: CGFloat(selectedCrayon.green)/225, blue: CGFloat(selectedCrayon.blue)/225, alpha:1.0)

        return cell
    }


    
    // MARK: - Navigation
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Get Cell Label
        let indexPath = tableView.indexPathForSelectedRow;
        let currentCell = tableView.cellForRow(at: indexPath!) as UITableViewCell!;
        valueToPass = currentCell?.backgroundColor
        colorNameToPass = currentCell?.textLabel?.text
        //Pass slider values
        //redsliderValueToPass = (currentCell?.backgroundColor)!
        performSegue(withIdentifier: "ColorDetailSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "ColorDetailSegue") {
            // initialize new view controller and cast it as your view controller
            let destinationVC = segue.destination as! DetailViewController
            // your new view controller should have property that will store passed value
            destinationVC.passedCrayonColor = valueToPass
            destinationVC.passedCrayonColorName = colorNameToPass
        }
        
    }
}
    
