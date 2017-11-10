//
//  CrayonViewController.swift
//  AC-iOS-Unit2Final
//
//  Created by C4Q on 11/10/17.
//  Copyright © 2017 Karen Fuentes. All rights reserved.
//

import UIKit

class CrayonViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    @IBOutlet weak var crayonTableView: UITableView!
    
    
    var crayons: [Crayon] = []
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return crayons.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let crayonCell = crayonTableView.dequeueReusableCell(withIdentifier: "Crayon Cell", for: indexPath)
        let crayon = crayons[indexPath.row]
        crayonCell.textLabel?.text = crayon.name
        crayonCell.detailTextLabel?.text = crayon.hex
        let redColor = CGFloat(crayon.red/255)
        let greenColor = CGFloat(crayon.green/255)
        let blueColor = CGFloat(crayon.blue/255)
        crayonCell.backgroundColor = UIColor(displayP3Red: redColor, green: greenColor, blue: blueColor, alpha: 1)
        return crayonCell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationCrayon = segue.destination as? DetailViewController {
            let selectedRow = crayonTableView.indexPathForSelectedRow!.row
            let selectedCrayon = crayons[selectedRow]
            destinationCrayon.myCrayon = selectedCrayon
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.crayonTableView.delegate = self
        self.crayonTableView.dataSource = self
        crayons = Crayon.allTheCrayons

       
    }

    
    
    
    
    
    
    
    
    

}
