//
//  CrayonMainViewController.swift
//  AC-iOS-Unit2Final
//
//  Created by Luis Calle on 11/10/17.
//  Copyright © 2017 Karen Fuentes. All rights reserved.
//

import UIKit

class CrayonMainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var allCrayons = [Crayon]()

    @IBOutlet weak var crayonTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.crayonTableView.delegate = self
        self.crayonTableView.dataSource = self
        self.allCrayons = Crayon.allTheCrayons
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allCrayons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let crayonCell = tableView.dequeueReusableCell(withIdentifier: "Crayon Cell", for: indexPath)
        let crayonRow = allCrayons[indexPath.row]
        crayonCell.textLabel?.text = crayonRow.name
        crayonCell.detailTextLabel?.text = crayonRow.hex
        crayonCell.backgroundColor = UIColor(displayP3Red: CGFloat(crayonRow.red/255), green: CGFloat(crayonRow.green/255), blue: CGFloat(crayonRow.blue/255), alpha: 1)
        return crayonCell
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
