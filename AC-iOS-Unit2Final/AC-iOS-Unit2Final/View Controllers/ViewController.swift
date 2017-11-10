//
//  ViewController.swift
//  AC-iOS-Unit2Final
//
//  Created by C4Q on 11/10/17.
//  Copyright © 2017 Karen Fuentes. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let colors = Crayon.allTheCrayons

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self

        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let colorCell = colors[indexPath.row]
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "color cell", for: indexPath)
        cell.textLabel?.text = colorCell.name
        cell.detailTextLabel?.text = colorCell.hex
        cell.backgroundColor = UIColor(red: CGFloat(colorCell.red / 255), green: CGFloat(colorCell.green / 255), blue: CGFloat(colorCell.blue / 255), alpha: 1.0)
        return cell
    }


    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController {
            destination.color = colors [tableView.indexPathForSelectedRow!.row]
        }
    }

}
