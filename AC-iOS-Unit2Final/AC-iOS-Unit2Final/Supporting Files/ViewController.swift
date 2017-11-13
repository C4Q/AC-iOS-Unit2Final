//  ViewController.swift
//  AC-iOS-Unit2Final
//  Created by Winston Maragh.

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
	
	@IBOutlet weak var crayonsTableView: UITableView!
	
	var allCrayons	= Crayon.allTheCrayons

	override func viewDidLoad() {
		super.viewDidLoad()
		self.crayonsTableView.dataSource = self
		self.crayonsTableView.delegate = self
    }

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return allCrayons.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let crayon = allCrayons[indexPath.row]
		let cell = self.crayonsTableView.dequeueReusableCell(withIdentifier: "Crayon Cell", for: indexPath)
		cell.textLabel?.text = crayon.name
		cell.detailTextLabel?.text = crayon.hex
		let red = CGFloat(crayon.red)/255.0
		let green = CGFloat(crayon.green)/255.0
		let blue = CGFloat(crayon.blue)/255.0
		cell.backgroundColor = UIColor(displayP3Red: red, green: green, blue: blue, alpha: 1.0)
		return cell
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let destination = segue.destination as? DetailViewController {
			let row = crayonsTableView.indexPathForSelectedRow!.row
			destination.crayon = allCrayons[row]
		}
	}

}
