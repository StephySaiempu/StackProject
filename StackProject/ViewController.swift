//
//  ViewController.swift
//  StackProject
//
//  Created by Girira Stephy on 01/03/21.
//

import UIKit
import Stacks

class ViewController: UIViewController {

    var stackManager: StackManager!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        stackManager = StackManager.init()
        let string = stackManager.getMsg()
        
        print(string)
    }


}

