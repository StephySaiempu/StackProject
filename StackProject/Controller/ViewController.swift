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
        view.backgroundColor = UIColor.ProjectTheme.AppBackgroundColor
        setUpViews()
    }


    func setUpViews(){
        let amountView = EMISelectionView.init(with:UIColor.ProjectTheme.AppBackgroundColor , circular: false, shadow: false, borderColor: nil, borderThickness: nil)
        view.addSubview(amountView)
        amountView.translatesAutoresizingMaskIntoConstraints = false
        amountView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        amountView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        amountView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        amountView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
}

