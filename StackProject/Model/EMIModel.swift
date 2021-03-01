//
//  EMIModel.swift
//  StackProject
//
//  Created by Girira Stephy on 01/03/21.
//

import UIKit


struct EMIModel{
    
    var amountToBePaid: String?
    var duration: String?
    var selected: Bool?
    var backgroundColor: UIColor?
    
    init(amountToBePaid: String?,duration: String?,selected: Bool?,backgroundColor: UIColor?) {
        self.amountToBePaid = amountToBePaid
        self.duration = duration
        self.selected = selected
        self.backgroundColor = backgroundColor
    }
}
