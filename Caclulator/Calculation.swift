//
//  Calculation.swift
//  Caclulator
//
//  Created by Daniel Richmond on 12/3/17.
//  Copyright © 2017 Dan. All rights reserved.
//

import UIKit

class Calculation {
    
    //MARK: Properties
    
    var name: String
    var value: String
    
    //MARK: Initialization
    
    init?(name: String, value : String) {
        
        if name.isEmpty || value.isEmpty {
            return nil
        }
        
        self.name = name
        self.value = value
    }
    
}
