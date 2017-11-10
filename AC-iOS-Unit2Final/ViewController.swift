//
//  ViewController.swift
//  AC-iOS-Unit2Final
//
//  Created by Lisa J on 11/10/17.
//  Copyright © 2017 Karen Fuentes. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var crayonArr = [Crayon]()
    @IBOutlet weak var tableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return crayonArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rColor = (crayonArr[indexPath.row].red)
        let gColor = (crayonArr[indexPath.row].green)
        let bColor = (crayonArr[indexPath.row].blue)
        let cell = tableView.dequeueReusableCell(withIdentifier: "crayonCell", for: indexPath)
        cell.textLabel?.text = crayonArr[indexPath.row].name
        cell.detailTextLabel?.text = crayonArr[indexPath.row].hex
        cell.backgroundColor = UIColor(displayP3Red: CGFloat(rColor/255), green: CGFloat(gColor/255), blue:CGFloat(bColor/255), alpha: 1)
        return cell 
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        loadData()
        
        // Do any additional setup after loading the view.
    }
    func loadData() {
      crayonArr = Crayon.allTheCrayons//loads all the crayon colors
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            print("segue works")
            if let destination = segue.destination as? detailViewController {
                destination.crayon = crayonArr[tableView.indexPathForSelectedRow!.row]
                print("set segue destination")
            }
        }
    }
}
