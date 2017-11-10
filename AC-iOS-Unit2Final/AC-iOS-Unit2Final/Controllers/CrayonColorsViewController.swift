//
//  CrayonColorsViewController.swift
//  AC-iOS-Unit2Final
//
//  Created by Clint Mejia on 11/10/17.
//  Copyright © 2017 Karen Fuentes. All rights reserved.
//

import UIKit

class CrayonColorsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var crayonTableView: UITableView!
    
    var crayons = [Crayon]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        crayonTableView.delegate = self
        crayonTableView.dataSource = self
        loadData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func loadData() {
        self.crayons = Crayon.allTheCrayons
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return crayons.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "crayonCell", for: indexPath)
        let crayonToUse = crayons[indexPath.row]
        if crayonToUse.name == "Black" {
            cell.textLabel?.textColor = UIColor.white
            cell.detailTextLabel?.textColor = UIColor.white
        }
        cell.textLabel?.text = crayonToUse.name
        cell.detailTextLabel?.text = "Hex value: \(crayonToUse.hex)"
        cell.contentView.backgroundColor = UIColor(displayP3Red: CGFloat(crayonToUse.red / 255), green: CGFloat(crayonToUse.green / 255 ), blue: CGFloat(crayonToUse.blue / 255), alpha: CGFloat(1.0))
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? CrayonDetailViewController {
            destination.selectedCrayon = crayons[crayonTableView.indexPathForSelectedRow!.row]
        }
    }
}

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */


