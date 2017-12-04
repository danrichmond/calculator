//
//  CalculationTableViewController.swift
//  Caclulator
//
//  Created by Daniel Richmond on 12/3/17.
//  Copyright © 2017 Dan. All rights reserved.
//

import UIKit

class CalculationTableViewController: UITableViewController {
    
    //MARK: Properties
    
    var calculations = [Calculation]()
    
    @IBOutlet weak var labelc: UILabel!
    var name:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let nameToDisplay = name {
            labelc.text = nameToDisplay
        }
        // Load the sample data
        loadSampleCalculations()
        
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

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: Private Methods
    
    private func loadSampleCalculations() {
        guard let calc1 = Calculation(name: "Rent cost/month", value: "287") else {
            fatalError("Unable to instantiate calc1")
        }
        guard let calc2 = Calculation(name: "Car+Insurance/month", value: "480") else {
            fatalError("Unable to instantiate calc2")
        }
        calculations += [calc1, calc2]
    }

}
