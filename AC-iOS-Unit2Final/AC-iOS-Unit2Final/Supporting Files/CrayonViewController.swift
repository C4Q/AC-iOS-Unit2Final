//
//  CrayonViewController.swift
//  AC-iOS-Unit2Final
//
//  Created by C4Q on 11/10/17.
//  Copyright © 2017 Karen Fuentes. All rights reserved.
//

import UIKit

class CrayonViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var crayonTableView: UITableView!
   
//    let colorModel = SetColor()
    var crayons = [Crayon]()
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.crayonTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        crayonTableView.delegate = self
        crayonTableView.dataSource = self
        crayons = Crayon.allTheCrayons
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Crayon.allTheCrayons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let crayon = crayons[indexPath.row]
        let cell = crayonTableView.dequeueReusableCell(withIdentifier: "Crayon Cell", for: indexPath)
        cell.textLabel?.text = crayon.name
        cell.detailTextLabel?.text = crayon.hex
        cell.backgroundColor = UIColor(displayP3Red: CGFloat(crayon.red / 255), green: CGFloat(crayon.green / 255), blue: CGFloat(crayon.blue / 255), alpha: 1)
        SetColor.red = CGFloat(crayon.red)
        SetColor.green = CGFloat(crayon.blue)
        SetColor.blue = CGFloat(crayon.green)
        
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any? ) {
        if let cell = sender as? UITableViewCell {
            let selectedColor = ((crayonTableView.indexPath(for: cell)?.row)! + 1)

            if segue.identifier == "Details" {
                if let destination = segue.destination as? DetailViewController {
                    destination.selectedCrayon = crayons[crayonTableView.indexPathForSelectedRow!.row]
                }
            }
        }
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let cellSelected =  sender as? UITableViewCell {
//            if segue.identifier == "Details" {
//                if let destination = segue.destination as? DetailViewController {
//                    destination.selectedCrayon = crayons[crayonTableView.indexPathForSelectedRow!.row]
//                }
//            }
//        }
//    }
}
