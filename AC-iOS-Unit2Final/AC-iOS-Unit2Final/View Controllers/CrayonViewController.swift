//
//  CrayonViewController.swift
//  AC-iOS-Unit2Final
//
//  Created by Franklin Figueroa on 11/21/17.
//  Copyright © 2017 Karen Fuentes. All rights reserved.
//

import UIKit
import Foundation

class CrayonViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
   
    @IBOutlet weak var tableView: UITableView!
    
    var allCrayonColors = [Crayon]()
    let cellId = "Individual Crayon Cells"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        allCrayonColors = Crayon.allTheCrayons
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allCrayonColors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellId, for: indexPath)
        let crayon = allCrayonColors[indexPath.row]
        cell.textLabel?.text = crayon.name
        cell.detailTextLabel?.text = crayon.hex
        cell.contentView.backgroundColor = UIColor(displayP3Red: CGFloat(crayon.red)/255, green: CGFloat(crayon.green)/255 , blue: CGFloat(crayon.blue)/255, alpha: 1)
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailedColorViewController {
        let indexPathRow = tableView.indexPathForSelectedRow!.row
        let selectedCrayon = allCrayonColors[indexPathRow]
        destination.crayon = selectedCrayon
        
        }
    }

}

