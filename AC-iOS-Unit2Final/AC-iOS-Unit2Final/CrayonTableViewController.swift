//
//  CrayonTableViewController.swift
//  AC-iOS-Unit2Final
//
//  Created by Reiaz Gafar on 11/10/17.
//  Copyright © 2017 Karen Fuentes. All rights reserved.
//

import UIKit

class CrayonTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var crayonColors = Crayon.allTheCrayons
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return crayonColors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        let color = crayonColors[indexPath.row]
        cell.textLabel?.text = color.name
        cell.detailTextLabel?.text = color.hex
        if color.name == "Black" {
            cell.textLabel?.textColor = .white
            cell.detailTextLabel?.textColor = .white
        }
        cell.backgroundColor = UIColor(displayP3Red: CGFloat(color.red/255), green: CGFloat(color.green/255), blue: CGFloat(color.blue/255), alpha: 1)
        
        return cell
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController {
            let selectedRow = tableView.indexPathForSelectedRow?.row
            let selectedColor = self.crayonColors[selectedRow!]
            destination.color = selectedColor
        }
        
        
        
        
    }


}
