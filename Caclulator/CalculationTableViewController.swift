//
//  CalculationTableViewController.swift
//  Caclulator
//
//  Created by Daniel Richmond on 12/3/17.
//  Copyright © 2017 Dan. All rights reserved.
//

import UIKit

var calculations = [Calculation]()

class CalculationTableViewController: UITableViewController {
    
    //MARK: Properties
    @IBOutlet weak var labelc: UILabel!
    var name:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let nameToDisplay = name {
            labelc.text = nameToDisplay
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return calculations.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "CalculationTableViewCell"
        
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CalculationTableViewCell else {
            fatalError("The dequeued cell is not an instance of CalculationTableViewCell.")
        }
        
        let calculation = calculations[indexPath.row]
        
        cell.nameLabel.text = calculation.name
        cell.valueLabel.text = calculation.value
        
        return cell
    }

}
