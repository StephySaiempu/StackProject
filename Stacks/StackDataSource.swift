//
//  StackDataSource.swift
//  Stacks
//
//  Created by Girira Stephy on 01/03/21.
//

import UIKit

//REQUIRED DataSource protocol. All UIVIew objects that are passed to StackManager must confirm to this protocol
public protocol StackDataSource: UIView{
    //state of view in Stack
    var state: StateOfView { get set }
    //This is a required property to  add custom actions to move forward or backward in the stacks.
    var navigationDelegate: NavigationProtocolForStack? { get set }
    //Required for StackManager to identify translation values of next view
    func heightOfHeaderView() -> CGFloat
//    //Recieve a any values that is passed by the previous view in stack
//    func recieveIncomingData(value: Any?)
//    //Send any values to the next view in Stack
//    func sendDataToNextView() -> Any?
}


public protocol StackManagerDataSource: AnyObject {
    func viewForStack() -> [StackDataSource]
}
