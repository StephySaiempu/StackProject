//
//  AmountSelectionView.swift
//  StackProject
//
//  Created by Girira Stephy on 01/03/21.
//

import UIKit
import Stacks

class AmountSelectionView: BaseView{
    
    var titleLabel: UILabel!
    var descriptionLabel: UILabel!
    var creditTextLabel: UILabel!
    var creditAmountLabel: UILabel!
    var amountSelectionView: BaseView!
    var amountSelectionDescription: UILabel!
    weak var navigationDelegate: NavigationProtocolForStack?
    
    public var currentState: StateOfView!{
        didSet{
            self.titleLabel.alpha = 0
            self.descriptionLabel.alpha = 0
            creditAmountLabel.alpha = 0
            creditTextLabel.alpha = 0
            switch currentState {
            case .dismiss:
                break
            case .visible:
                self.titleLabel.alpha = 1
                self.descriptionLabel.alpha = 1
                break
            case .background:
                creditTextLabel.alpha = 1
                creditAmountLabel.alpha = 1
                break
            default:
                break
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        titleLabel = UILabel()
        self.addSubview(titleLabel)
        titleLabel.textColor = UIColor.ProjectTheme.TextColor
        titleLabel.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        titleLabel.text = "nikunj, How much do you need?"
        
        descriptionLabel = UILabel()
        self.addSubview(descriptionLabel)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textColor = UIColor.ProjectTheme.TextColor
        descriptionLabel.font = UIFont.systemFont(ofSize: 13, weight: .light)
        descriptionLabel.text = "move the dial and set any amount you need upto ₹4,87,891.00"
        
        creditTextLabel = UILabel()
        self.addSubview(creditTextLabel)
        creditTextLabel.text = "credit amount"
        creditTextLabel.textColor = UIColor.ProjectTheme.TextColor
        creditTextLabel.alpha = 0
        
        creditAmountLabel = UILabel()
        self.addSubview(creditAmountLabel)
        creditAmountLabel.textColor = UIColor.ProjectTheme.TextColor
        creditAmountLabel.alpha = 0
        creditAmountLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        amountSelectionView = BaseView.init(with: .white, circular: false, shadow: false, borderColor: nil, borderThickness: nil)
        self.addSubview(amountSelectionView)
        
        amountSelectionDescription = UILabel()
        self.addSubview(amountSelectionDescription)
        amountSelectionDescription.numberOfLines = 0
        amountSelectionDescription.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        amountSelectionDescription.textColor = UIColor.ProjectTheme.TextColor
        amountSelectionDescription.textAlignment = .center
        amountSelectionDescription.text = "stash is instant. money will be credited within seconds."
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        [titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
         titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 48),
         titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20)].forEach({$0.isActive = true})
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        [descriptionLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
         descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
         descriptionLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20)].forEach({$0.isActive = true})
        
        creditTextLabel.translatesAutoresizingMaskIntoConstraints = false
        [creditTextLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
         creditTextLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 48)].forEach({$0.isActive = true})
        
        creditAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        [creditAmountLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
         creditAmountLabel.topAnchor.constraint(equalTo: creditTextLabel.bottomAnchor, constant: 16)].forEach({$0.isActive = true})
        
        
        amountSelectionView.translatesAutoresizingMaskIntoConstraints = false
        [amountSelectionView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
         amountSelectionView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 60),
         amountSelectionView.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -60),
         amountSelectionView.heightAnchor.constraint(equalTo: amountSelectionView.widthAnchor, constant: 0)].forEach({$0.isActive = true})
        
        amountSelectionDescription.translatesAutoresizingMaskIntoConstraints = false
        [amountSelectionDescription.leftAnchor.constraint(equalTo: amountSelectionView.leftAnchor, constant: 20),
         amountSelectionDescription.rightAnchor.constraint(equalTo: amountSelectionView.rightAnchor, constant: -20),
         amountSelectionDescription.bottomAnchor.constraint(equalTo: amountSelectionView.bottomAnchor, constant: -20)].forEach({$0.isActive = true})
    }
}


extension AmountSelectionView: StackDataSource{
    
    var state: StateOfView {
        get {
            return currentState
        }
        set(newValue) {
            self.currentState = newValue
        }
    }
    
    func heightOfHeaderView() -> CGFloat {
        return 96
    }
    
}
