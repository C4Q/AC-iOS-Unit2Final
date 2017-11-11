//
//  CrayonViewController.swift
//  AC-iOS-Unit2Final
//
//  Created by C4Q on 11/10/17.
//  Copyright © 2017 Karen Fuentes. All rights reserved.
//

import UIKit

class CrayonViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var crayons: [Crayon] = []
    
    @IBOutlet weak var crayonTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.crayonTableView.delegate = self
        self.crayonTableView.dataSource = self
        crayons = Crayon.allTheCrayons
    }
    
    //MARK: - Table view Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return crayons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let color = crayons[indexPath.row]
        let cell = crayonTableView.dequeueReusableCell(withIdentifier: "Cell Color", for: indexPath)
        cell.textLabel?.text = color.name
        cell.detailTextLabel?.text = color.hex
        cell.backgroundColor = UIColor(red: CGFloat(color.red/255), green: CGFloat(color.green/255), blue: CGFloat(color.blue/255), alpha: 1.0)
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let rowColorIdx = crayonTableView.indexPathForSelectedRow?.row
        let colorSend = segue.destination as? DetailCrayonViewController
        colorSend?.color = crayons[rowColorIdx!]
    }
}
