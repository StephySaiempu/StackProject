//
//  StackManager.swift
//  Stacks
//
//  Created by Girira Stephy on 01/03/21.
//

import UIKit


public class StackManager: UIView{
    

    public weak var dataSource: StackManagerDataSource? {
        didSet {
            initializeStackedViews()
        }
    }
    private var stackViews = [StackDataSource]()
    private var currentValue = 0
    var edgeSwipeGesture: UIScreenEdgePanGestureRecognizer!
    var dismissTapGesture: UITapGestureRecognizer!
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func initializeStackedViews() {
        guard let data = dataSource else { return }
        assert(data.viewForStack().count > 2, StackError.minimumViewsRequired.message)
        stackViews = data.viewForStack()
        guard let firstView = stackViews.first else {return}
        firstView.state = .visible
        setUpViews()
        initiateGestureRecogniser()
        
    }
    
    func setUpViews(){
        stackViews.forEach { (stackedView) in
            self.addSubview(stackedView)
            stackedView.translatesAutoresizingMaskIntoConstraints = false
            [stackedView.leftAnchor.constraint(equalTo: self.leftAnchor),
             stackedView.rightAnchor.constraint(equalTo: self.rightAnchor),
             stackedView.heightAnchor.constraint(equalToConstant: self.bounds.height),
             stackedView.topAnchor.constraint(equalTo: self.bottomAnchor)].forEach({$0.isActive = true})
            stackedView.transform = .identity
            stackedView.navigationDelegate = self
        }
        
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.3, options: [.curveEaseIn], animations: { [weak self] in
            self?.stackViews[0].transform = CGAffineTransform.init(translationX: 0, y: -((self?.bounds.height)!))
            self?.stackViews[1].transform = CGAffineTransform.init(translationX: 0, y: -80)
        }, completion: nil)
    }
    
    func initiateGestureRecogniser(){
        edgeSwipeGesture = UIScreenEdgePanGestureRecognizer.init(target: self, action: #selector(edgeSwipeDetected(sender:)))
        edgeSwipeGesture.edges = .right
        stackViews[currentValue].addGestureRecognizer(edgeSwipeGesture)
        
        dismissTapGesture = UITapGestureRecognizer.init(target: self, action: #selector(dismissPresentedViews(sender:)))
        dismissTapGesture.cancelsTouchesInView = false
        self.addGestureRecognizer(dismissTapGesture)
        
    }
    //dismissing all the views which are in stack
    public func dismissAllStacks(){
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: [.curveEaseOut,.curveEaseIn], animations: {
            self.transform = CGAffineTransform.init(translationX: 0, y: self.frame.height)
        }) { (_) in
            self.removeFromSuperview()
        }
    }
    
}
//Selectors for Gestures
extension StackManager{
    
    @objc func edgeSwipeDetected(sender: UIPanGestureRecognizer){
        var dismissable = false
        if sender.translation(in: sender.view).x < -100 {
            dismissable = true
        }
        if sender.state == .ended{
            if dismissable{
                if currentValue == 0{
                 dismissAllStacks()
                }
                stackViews[currentValue].state = .dismiss
                self.dismissCurrentView()
            }
        }
    }
    
    @objc func dismissPresentedViews(sender: UITapGestureRecognizer){
        let location = sender.location(in: self)
        for view in stackViews.reversed(){
            if view.frame.contains(location){
                guard let index = stackViews.firstIndex(where: { $0 === view }) else { return }
                if index > currentValue{
                    view.state = .visible
                    self.moveForward()
                    return
                }
                if index < currentValue{
                    for i in (index + 1)...stackViews.count-1{
                        stackViews[i].state = .dismiss
                        self.dismissCurrentView()
                    }
                    return
                }
                return
            }
        }
    }
}


extension StackManager: NavigationProtocolForStack{
    public func moveForward() {
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [.curveEaseOut], animations: { [weak self] in
            guard let unwrappedSelf = self else { return }
            var heightOffest: CGFloat = 0
            for i in 0...unwrappedSelf.currentValue{
                heightOffest = heightOffest + unwrappedSelf.stackViews[i].heightOfHeaderView()
            }
            unwrappedSelf.stackViews[unwrappedSelf.currentValue].state = .background
            unwrappedSelf.stackViews[unwrappedSelf.currentValue + 1].transform = CGAffineTransform.init(translationX: 0, y: -(unwrappedSelf.bounds.height - heightOffest))
            if unwrappedSelf.stackViews.indices.contains(unwrappedSelf.currentValue + 2){
                unwrappedSelf.stackViews[unwrappedSelf.currentValue + 2].transform = CGAffineTransform.init(translationX: 0, y: -80)
            }
        }, completion: nil)
        if currentValue <= stackViews.count{
            
            currentValue += 1
            stackViews[currentValue].addGestureRecognizer(edgeSwipeGesture)
        }
        
    }
    
    public func dismissCurrentView() {
        if currentValue == 0{
            return
        }
        self.currentValue -= 1
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [.curveEaseOut], animations: { [weak self] in
            guard let unwrappedSelf = self else { return }
            for i in (unwrappedSelf.currentValue + 1)...unwrappedSelf.stackViews.count - 1{
                unwrappedSelf.stackViews[i].transform  = .identity
            }
            unwrappedSelf.stackViews[unwrappedSelf.currentValue + 1].transform = CGAffineTransform.init(translationX: 0, y: -80)
        }) { [weak self] (_) in
            guard let unwrappedSelf = self else { return }
            unwrappedSelf.stackViews[unwrappedSelf.currentValue].addGestureRecognizer(unwrappedSelf.edgeSwipeGesture)
        }
    }
}
