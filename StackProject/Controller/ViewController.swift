//
//  ViewController.swift
//  StackProject
//
//  Created by Girira Stephy on 01/03/21.
//

import UIKit
import Stacks

class ViewController: UIViewController {

    var stackManager: StackManager?
    var viewsArray = [StackDataSource]()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.ProjectTheme.AppBackgroundColor
        setUpViews()
    }


    func setUpViews(){
        
        let amountView = AmountSelectionView.init(with: UIColor.ProjectTheme.firstViewBackgroundColor, circular: false, shadow: false, borderColor: nil, borderThickness: nil)
        viewsArray.append(amountView)
        let emiSelectionView = EMISelectionView.init(with: UIColor.ProjectTheme.secondViewBackgroundColor, circular: false, shadow: false, borderColor: nil, borderThickness: nil)
        viewsArray.append(emiSelectionView)
        let paymentView = PaymentView.init(with: UIColor.ProjectTheme.thirdViewBackgroundColor, circular: false, shadow: false, borderColor: nil, borderThickness: nil)
        viewsArray.append(paymentView)
        stackManager = StackManager.init(frame: view.frame)
        stackManager?.dataSource = self
        view.addSubview(stackManager!)
    
    }
}


extension ViewController: StackManagerDataSource{
    func viewForStack() -> [StackDataSource]{
        return viewsArray
    }
}
