//
//  CrayonViewController.swift
//  AC-iOS-Unit2Final
//
//  Created by C4Q on 11/10/17.
//  Copyright © 2017 Karen Fuentes. All rights reserved.
//

import UIKit
//UIColor(displayP3Red:green:blue:alpha:)

class CrayonViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var crayons: [Crayon] = []
    let colorName = "blue"
    
    @IBOutlet weak var crayonTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        crayonTableView.delegate = self
        crayonTableView.dataSource = self
        loadData()
    }
    func loadData(){
        self.crayons = Crayon.allTheCrayons
    }
    
    //datasource methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return crayons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Crayon Cell", for: indexPath)
        let crayon = crayons[indexPath.row]
        //set cell properties
        cell.textLabel?.text = crayon.name
        cell.detailTextLabel?.text = crayon.hex
        //getting backgroundColors from model
        cell.backgroundColor = UIColor(displayP3Red: CGFloat(crayon.red / 255), green: CGFloat(crayon.green / 255), blue: CGFloat(crayon.blue / 255), alpha:1)
        return cell
    }
    
    //prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? DetailedCrayonViewController{
            destination.crayon = crayons[crayonTableView.indexPathForSelectedRow!.row]
            
            
        }
    }
}
