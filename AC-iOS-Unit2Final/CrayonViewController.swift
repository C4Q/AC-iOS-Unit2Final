//
//  CrayonViewController.swift
//  AC-iOS-Unit2Final
//
//  Created by Masai Young on 11/10/17.
//  Copyright © 2017 Karen Fuentes. All rights reserved.
//

import Foundation
import UIKit

class CrayonViewController: UIViewController {
    
    @IBOutlet weak var crayonTableView: UITableView!
    
    var delegate: UITableViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.crayonTableView.delegate = self
        self.crayonTableView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

// MARK: Table View Delegate
extension CrayonViewController: UITableViewDelegate {}

// MARK: Table View Data Source
extension CrayonViewController: UITableViewDataSource {
    
    // MARK: - Table Formation
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Crayon.allTheCrayons.count
    }
    
    // MARK: - Cell Rendering
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CrayonCell", for: indexPath)
        let currentIndex = indexPath.row
        let crayon = Crayon.allTheCrayons[currentIndex]
        cell.textLabel?.text = crayon.name
        cell.detailTextLabel?.text = crayon.hex
        cell.backgroundColor = UIColor(displayP3Red: CGFloat(crayon.red/255), green: CGFloat(crayon.green/255), blue: CGFloat(crayon.blue/255), alpha: 1)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 1. We need to check what our sender is. Afterall, there might be multiple segues set up...
        // 2. check for the right storyboard segue
        // 3. Get the destination VC
        guard let myDetailViewController = segue.destination as? DetailViewController else {
            return
        }
        
        if let tappedCell = sender as? UITableViewCell, segue.identifier == "DetailSegue" {
            let cellIndexPath = crayonTableView.indexPath(for: tappedCell)!
            let crayonPressed = Crayon.allTheCrayons[cellIndexPath.row]
            myDetailViewController.originalCrayon = crayonPressed
            myDetailViewController.crayon = DetailViewController.myCrayon(red: CGFloat(crayonPressed.red/255), blue: CGFloat(crayonPressed.blue/255), green: CGFloat(crayonPressed.green/255), alpha: 1, name: crayonPressed.name)
        }
        
    }
    
}
