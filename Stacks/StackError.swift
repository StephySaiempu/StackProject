//
//  StackError.swift
//  Stacks
//
//  Created by Girira Stephy on 01/03/21.
//

import Foundation

enum StackError: Error {
    case minimumViewsRequired
    
    var message: String {
        switch self {
        case .minimumViewsRequired: return "Invalid number of views. To create a stack please provide minimum of two views."
        }
    }
}
