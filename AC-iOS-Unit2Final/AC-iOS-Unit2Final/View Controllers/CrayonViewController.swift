//
//  CrayonViewController.swift
//  AC-iOS-Unit2Final
//
//  Created by C4Q on 11/10/17.
//  Copyright © 2017 Karen Fuentes. All rights reserved.
//

import UIKit

class CrayonViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var crayons = [Crayon]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.crayons = Crayon.allTheCrayons
        // Do any additional setup after loading the view.
    }



    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return crayons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let color = crayons[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Color Name Cell", for: indexPath)
        cell.textLabel?.text = color.name
        cell.textLabel?.textColor = UIColor.white
        cell.detailTextLabel?.text = color.hex
        cell.detailTextLabel?.textColor = UIColor.white
        let cellBackground = UIColor(displayP3Red: CGFloat(color.red/255), green: CGFloat(color.green/255), blue: CGFloat(color.blue/255), alpha: 1.0)
        cell.backgroundColor = cellBackground
        
        return cell
        
    }
    
    
    // MARK: - Navigation

   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController {
            destination.crayon = crayons[tableView.indexPathForSelectedRow!.row]
        }
    }
 

}
