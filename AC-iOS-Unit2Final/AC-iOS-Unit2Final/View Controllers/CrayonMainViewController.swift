//
//  CrayonMainViewController.swift
//  AC-iOS-Unit2Final
//
//  Created by Luis Calle on 11/10/17.
//  Copyright © 2017 Karen Fuentes. All rights reserved.
//

import UIKit

class CrayonMainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var allCrayons = [Crayon]()

    @IBOutlet weak var crayonTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.crayonTableView.delegate = self
        self.crayonTableView.dataSource = self
        self.allCrayons = Crayon.allTheCrayons
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allCrayons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let crayonCell = tableView.dequeueReusableCell(withIdentifier: "Crayon Cell", for: indexPath)
        let crayonSelected = allCrayons[indexPath.row]
        guard let labelText = crayonCell.textLabel, let detailLabel = crayonCell.detailTextLabel else {
            return crayonCell
        }
        labelText.text = crayonSelected.name
        detailLabel.text = crayonSelected.hex
        if crayonSelected.hex == "#000000" {
            labelText.textColor = .white
            detailLabel.textColor = .white
        }
        crayonCell.backgroundColor = UIColor(displayP3Red: CGFloat(crayonSelected.red/255), green: CGFloat(crayonSelected.green/255), blue: CGFloat(crayonSelected.blue/255), alpha: 1)
        return crayonCell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? CrayonDetailedViewController {
            guard let tableRowSelectedPath = crayonTableView.indexPathForSelectedRow else {
                return
            }
            let selectedRow = tableRowSelectedPath.row
            let selectedCrayon = self.allCrayons[selectedRow]
            destination.crayon = selectedCrayon
        }
    }
 
}
