//
//  ViewController.swift
//  AC-iOS-Unit2Final
//
//  Created by C4Q on 11/10/17.
//  Copyright © 2017 Karen Fuentes. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    let crayons = Crayon.allTheCrayons
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Table View
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return crayons.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Crayon Cell", for: indexPath)
        let crayonToUse = crayons[indexPath.row]
        let redVal = crayonToUse.red / 255
        let blueVal = crayonToUse.blue / 255
        let greenVal = crayonToUse.green / 255
        
        cell.textLabel?.text = crayonToUse.name
        cell.detailTextLabel?.text = crayonToUse.hex
        //if too dark, make text white
        if (redVal + blueVal + greenVal) / 3 < 0.5 {
            cell.textLabel?.textColor = UIColor.white
            cell.detailTextLabel?.textColor = UIColor.white
        }
        cell.backgroundColor = UIColor(red: CGFloat(redVal), green: CGFloat(greenVal), blue: CGFloat(blueVal), alpha: 1)
        
        
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let cell = sender as? UITableViewCell else {
            return
        }
        guard segue.identifier == "Detail Segue" else {
            return
        }
        guard let detailViewController = segue.destination as? DetailViewController else {
            return
        }
        
        let crayon = crayons[tableView.indexPath(for: cell)!.row]
        detailViewController.selectedCrayon = crayon
    }
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
