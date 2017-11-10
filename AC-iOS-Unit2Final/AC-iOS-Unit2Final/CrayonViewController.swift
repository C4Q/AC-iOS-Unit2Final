//
//  CrayonViewController.swift
//  AC-iOS-Unit2Final
//
//  Created by C4Q on 11/10/17.
//  Copyright © 2017 Karen Fuentes. All rights reserved.
//

import UIKit

class CrayonViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var crayonArray = [Crayon]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        loadData()
    }
    
    func loadData() {
        crayonArray = Crayon.allTheCrayons
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return crayonArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let crayon = crayonArray[indexPath.row]
        let crayonCell = tableView.dequeueReusableCell(withIdentifier: "Crayon Cell", for: indexPath)
        crayonCell.textLabel?.text = crayon.name
        crayonCell.detailTextLabel?.text = crayon.hex
        if crayon.name == "Black" {
            crayonCell.textLabel?.textColor = .white
            crayonCell.detailTextLabel?.textColor = .white
        }
        crayonCell.backgroundColor = UIColor(displayP3Red: CGFloat(crayon.red/255.0), green: CGFloat(crayon.green/255.0), blue: CGFloat(crayon.blue/255.0), alpha: 1)
        return crayonCell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detail = segue.destination as? CrayonDetailsViewController {
            let selectedRow = tableView.indexPathForSelectedRow!.row
            let selectedCrayon = crayonArray[selectedRow]
            detail.selectedCrayon = selectedCrayon
        }
    }

}
