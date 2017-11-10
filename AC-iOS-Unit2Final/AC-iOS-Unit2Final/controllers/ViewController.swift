//
//  ViewController.swift
//  AC-iOS-Unit2Final
//
//  Created by C4Q on 11/10/17.
//  Copyright © 2017 Karen Fuentes. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var myCrayon = [Crayon]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        myCrayon = Crayon.allTheCrayons
        // Do any additional setup after loading the view.
    }
    
    func UIColorFromRGB(displayP3Red: Double, green: Double, blue: Double, alpha: Float) -> UIColor {
        return UIColor(
            red: CGFloat(displayP3Red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
           alpha: CGFloat(1.0)
        )
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myCrayon.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let crayon = myCrayon[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Color Cell", for: indexPath)
        cell.textLabel?.text = crayon.name
        cell.detailTextLabel?.text = crayon.hex
        cell.backgroundColor = UIColorFromRGB(displayP3Red: crayon.red, green: crayon.green, blue: crayon.blue, alpha: 1.0)
        return cell
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination
        switch segue.identifier! {
        case "crayonDetailSegue":
            if let destination = segue.destination as? CrayonDetailViewController {
                destination.crayon = myCrayon[tableView.indexPathForSelectedRow!.row]
            }
        default:
            fatalError()
        }
        // Pass the selected object to the new view controller.
    }

}
