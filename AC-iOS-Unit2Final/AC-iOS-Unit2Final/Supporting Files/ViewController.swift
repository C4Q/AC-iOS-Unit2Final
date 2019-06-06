//
//  ViewController.swift
//  AC-iOS-Unit2Final
//
//  Created by C4Q on 11/10/17.
//  Copyright © 2017 Karen Fuentes. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var allCrayons = Crayon.allTheCrayons
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.backgroundColor = UIColor.cyan
        self.tableView.delegate = self
        self.tableView.dataSource = self
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK - DATA SOURCE METHODS
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allCrayons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
          let crayon = allCrayons[indexPath.row]
        if crayon.name == "Black" {
            cell.textLabel?.textColor = .white
        }
          cell.textLabel?.text = crayon.name
          cell.detailTextLabel?.text = "Hex \(crayon.hex)"
          cell.backgroundColor = UIColor(red: CGFloat(crayon.red/255), green: CGFloat(crayon.green/255), blue: CGFloat(crayon.blue/255), alpha: 1)
          return cell
    }
  
    // MARK -Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ColorDetailViewController {
         let selectedRow = self.tableView.indexPathForSelectedRow!.row
          let selectedCrayon = self.allCrayons[selectedRow]
           destination.crayon = selectedCrayon
        }
    }
}


















///extra code IGNORE THIS. THIS AREA IS FOR ME.
//switch indexPath.row {
//
//        case 0 :
//           cell.contentView.backgroundColor = UIColor(red: 239/255, green: 222/255, blue: 205/255, alpha: 1.0)
//        case 1 :
//            cell.contentView.backgroundColor = UIColor(red: 205/255, green: 149/255, blue: 117/255, alpha: 1.0)
//        case 2 :
//           cell.contentView.backgroundColor = UIColor(red: 253/255, green: 217/255, blue: 181/255, alpha: 1.0)
//        case 3 :
//            cell.contentView.backgroundColor = UIColor(red: 120/255, green: 219/255, blue: 226/255, alpha: 1.0)
//        case 4 :
//            cell.contentView.backgroundColor = UIColor(red: 135/255, green: 169/255, blue: 107/255, alpha: 1.0)
//        case 5 :
//            cell.contentView.backgroundColor = UIColor(red: 255/255, green: 164/255, blue: 116/255, alpha: 1.0)
//        case 6 :
//             cell.contentView.backgroundColor = UIColor(red: 250/255, green: 231/255, blue: 181/255, alpha: 1.0)
//        case 7 :
//             cell.contentView.backgroundColor = UIColor(red: 159/255, green: 129/255, blue: 112/255, alpha: 1.0)
//        case 8 :
//             cell.contentView.backgroundColor = UIColor(red: 253/255, green: 124/255, blue: 110/255, alpha: 1.0)
//        case 9 :
//             cell.contentView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)
//        case 10 :
//             cell.contentView.backgroundColor = UIColor(red: 172/255, green: 229/255, blue: 238/255, alpha: 1.0)
//        case 11 :
//             cell.contentView.backgroundColor = UIColor(red: 31/255, green: 117/255, blue: 254/255, alpha: 1.0)
//        case 12 :
//             cell.contentView.backgroundColor = UIColor(red: 162/255, green: 162/255, blue: 208/255, alpha: 1.0)
//        case 13 :
//              cell.contentView.backgroundColor = UIColor(red: 102/255, green: 153/255, blue: 204/255, alpha: 1.0)
//        case 14 :
//             cell.contentView.backgroundColor = UIColor(red: 13/255, green: 152/255, blue: 184/255, alpha: 1.0)
//        case 15 :
//             cell.contentView.backgroundColor = UIColor(red: 115/255, green: 102/255, blue: 189/255, alpha: 1.0)
//        default:
//           cell.backgroundColor = UIColor.white
//
//        }
