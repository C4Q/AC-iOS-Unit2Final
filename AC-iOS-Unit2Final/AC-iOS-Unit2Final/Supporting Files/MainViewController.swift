//
//  MainViewController.swift
//  AC-iOS-Unit2Final
//
//  Created by Richard Crichlow on 11/10/17.
//  Copyright © 2017 Karen Fuentes. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var theCrayons = [Crayon]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        theCrayons = Crayon.allTheCrayons
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return theCrayons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let crayon = theCrayons[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        
        cell.backgroundColor = UIColor(displayP3Red: CGFloat(crayon.red / 255), green: CGFloat(crayon.green / 255), blue: CGFloat(crayon.blue / 255), alpha: 1)
        cell.textLabel?.text = crayon.name
        cell.detailTextLabel?.text = "Hex Value: \(crayon.hex)"
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailedViewController {
            let selectedRow = self.tableView.indexPathForSelectedRow!.row
            let selectedCrayon = self.theCrayons[selectedRow]
            destination.detailedCrayon = selectedCrayon
        }
    }
}
