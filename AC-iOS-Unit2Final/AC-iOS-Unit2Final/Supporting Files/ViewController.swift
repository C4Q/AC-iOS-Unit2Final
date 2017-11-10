//
//  ViewController.swift
//  AC-iOS-Unit2Final
//
//  Created by C4Q on 11/10/17.
//  Copyright © 2017 Karen Fuentes. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var allCrayons: [Crayon] = []
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
       self.tableView.delegate = self
        self.tableView.dataSource = self
        self.allCrayons = Crayon.allTheCrayons
        // Do any additional setup after loading the view.
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allCrayons.count
    }
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Crayon Cell", for: indexPath)
        let selectedCrayon = allCrayons[indexPath.row]
        cell.textLabel?.text = selectedCrayon.name
        cell.detailTextLabel?.text = selectedCrayon.hex
        cell.backgroundColor = UIColor(displayP3Red: CGFloat(selectedCrayon.red/255), green: CGFloat(selectedCrayon.green/255), blue: CGFloat(selectedCrayon.blue/255), alpha: 1)
        return cell
    }
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let destionation = segue.destination as? DetailsViewController
    let selectedIndex = tableView.indexPathForSelectedRow!.row
    let selectedCrayon = self.allCrayons[selectedIndex]
    destionation?.crayon = selectedCrayon
  
}

}














