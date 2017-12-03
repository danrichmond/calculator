//
//  CalculationTableViewCell.swift
//  Caclulator
//
//  Created by Daniel Richmond on 12/3/17.
//  Copyright © 2017 Dan. All rights reserved.
//

import UIKit

class CalculationTableViewCell: UITableViewCell {
    
    //MARK: Properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
