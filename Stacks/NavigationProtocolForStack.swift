//
//  NavigationProtocolForStack.swift
//  Stacks
//
//  Created by Girira Stephy on 01/03/21.
//

import UIKit

// navigation protocol
public protocol NavigationProtocolForStack: AnyObject{
    func moveForward()
    func dismissCurrentView()
}
