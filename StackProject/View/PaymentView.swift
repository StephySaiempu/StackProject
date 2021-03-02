//
//  PaymentView.swift
//  StackProject
//
//  Created by Girira Stephy on 01/03/21.
//


import UIKit
import Stacks

class PaymentView: BaseView{
    
    
    var titleView: BaseView!
    var titleLabel: UILabel!
    var questionLabel: UILabel!
    var descriptionLabel: UILabel!
    var accountThumbNail: BaseImageView!
    var bankName: UILabel!
    var cardLabel: UILabel!
    var selectionBaseView: BaseView!
    var createPlanView: BaseView!
    var createPlanLabel: UILabel!
    var selectImage: UIImageView!
    weak var navigationDelegate: NavigationProtocolForStack?
    
    public var currentState: StateOfView!{
        didSet{
            titleView.alpha = 0
            titleLabel.alpha = 0
            questionLabel.alpha = 0
            descriptionLabel.alpha = 0
            switch currentState {
            case .dismiss:
                titleView.alpha = 1
                titleLabel.alpha = 1
                break
            case .visible:
                titleView.alpha = 0
                titleLabel.alpha = 0
                questionLabel.alpha = 1
                descriptionLabel.alpha = 1
                break
            default:
                break
            }
            
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        titleView = BaseView.init(with: UIColor.ProjectTheme.ButtonColor, circular: false, shadow: false, borderColor: nil, borderThickness: nil)
        self.addSubview(titleView)
        titleView.alpha = 1
        
        titleLabel = UILabel()
        self.addSubview(titleLabel)
        titleLabel.text = "Select your bank account"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        titleLabel.alpha = 1
        
        questionLabel = UILabel()
        self.addSubview(questionLabel)
        questionLabel.text = "where should we send the money?"
        questionLabel.textColor = UIColor.ProjectTheme.TextColor
        questionLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        questionLabel.alpha = 0
        
        descriptionLabel = UILabel()
        self.addSubview(descriptionLabel)
        descriptionLabel.text = "amount will be credited to this bank account.\n EMI will also be debited from this bank account."
        descriptionLabel.textColor = UIColor.ProjectTheme.TextColor
        descriptionLabel.numberOfLines = 3
        descriptionLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        descriptionLabel.alpha = 0
        
        accountThumbNail = BaseImageView.init(with: .white, circular: false, shadow: false, borderColor: nil, borderThickness: nil)
        self.addSubview(accountThumbNail)
        accountThumbNail.image = UIImage.init(named: "bankIcon")
        accountThumbNail.contentMode = .scaleAspectFit
        accountThumbNail.tintColor = .white

        bankName = UILabel()
        self.addSubview(bankName)
        bankName.text = "HDFC Bank"
        bankName.textColor = .white
        bankName.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        
        cardLabel = UILabel()
        self.addSubview(cardLabel)
        cardLabel.text = "84xxxxxx-...-xxxxxxxxxx98"
        cardLabel.textColor = .white
        cardLabel.font = UIFont.systemFont(ofSize: 12, weight: .ultraLight)
        
        selectionBaseView = BaseView.init(with: UIColor(red: 0.22, green: 0.25, blue: 0.29, alpha: 1.00), circular: true, shadow: false, borderColor: nil, borderThickness: nil)
        self.addSubview(selectionBaseView)
        
        selectImage = UIImageView()
        self.addSubview(selectImage)
        selectImage.image = UIImage.init(named: "selectedIcon")
        
        createPlanView = BaseView.init(with: UIColor(red: 0.09, green: 0.13, blue: 0.17, alpha: 1.00), circular: false, shadow: false, borderColor: UIColor.ProjectTheme.ButtonBorderColor, borderThickness: 3)
        self.addSubview(createPlanView)
        
        createPlanLabel = UILabel()
        self.addSubview(createPlanLabel)
        createPlanLabel.text = "Change account"
        createPlanLabel.textColor = UIColor.ProjectTheme.ButtonBorderColor
        createPlanLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        titleView.translatesAutoresizingMaskIntoConstraints = false
        [titleView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
         titleView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0),
         titleView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
         titleView.heightAnchor.constraint(equalToConstant: 145)].forEach({$0.isActive = true})
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        [titleLabel.topAnchor.constraint(equalTo: titleView.topAnchor, constant: 30),
         titleLabel.centerXAnchor.constraint(equalTo: titleView.centerXAnchor, constant: 0)].forEach({$0.isActive = true})
        
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        [questionLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
         questionLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
         questionLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 30)].forEach({$0.isActive = true})
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        [descriptionLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
         descriptionLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
         descriptionLabel.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 14)].forEach({$0.isActive = true})
        
        accountThumbNail.translatesAutoresizingMaskIntoConstraints = false
        [accountThumbNail.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
         accountThumbNail.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 30),
         accountThumbNail.heightAnchor.constraint(equalToConstant: 48),
         accountThumbNail.widthAnchor.constraint(equalToConstant: 48)].forEach({$0.isActive = true})
        
        bankName.translatesAutoresizingMaskIntoConstraints = false
        [bankName.leftAnchor.constraint(equalTo: accountThumbNail.rightAnchor, constant: 16),
         bankName.bottomAnchor.constraint(equalTo: accountThumbNail.centerYAnchor, constant: 0)].forEach({$0.isActive = true})
        
        cardLabel.translatesAutoresizingMaskIntoConstraints = false
        [cardLabel.leftAnchor.constraint(equalTo: accountThumbNail.rightAnchor, constant: 14),
         cardLabel.topAnchor.constraint(equalTo: accountThumbNail.centerYAnchor, constant: 4)].forEach({$0.isActive = true})
        
        selectionBaseView.translatesAutoresizingMaskIntoConstraints = false
        [selectionBaseView.heightAnchor.constraint(equalToConstant: 36),
         selectionBaseView.widthAnchor.constraint(equalToConstant: 36),
         selectionBaseView.centerYAnchor.constraint(equalTo: accountThumbNail.centerYAnchor, constant: 0),
         selectionBaseView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20)].forEach({$0.isActive = true})
        
        selectImage.translatesAutoresizingMaskIntoConstraints = false
        [selectImage.centerXAnchor.constraint(equalTo: selectionBaseView.centerXAnchor, constant: 0),
         selectImage.centerYAnchor.constraint(equalTo: selectionBaseView.centerYAnchor, constant: 0),
         selectImage.widthAnchor.constraint(equalToConstant: 24),
         selectImage.heightAnchor.constraint(equalToConstant: 24)].forEach({$0.isActive = true})
        
        createPlanView.translatesAutoresizingMaskIntoConstraints = false
        [createPlanView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 40),
         createPlanView.topAnchor.constraint(equalTo: accountThumbNail.bottomAnchor, constant: 20)].forEach({$0.isActive = true})
        
        createPlanLabel.translatesAutoresizingMaskIntoConstraints = false
        [createPlanLabel.leftAnchor.constraint(equalTo: createPlanView.leftAnchor, constant: 20),
         createPlanLabel.rightAnchor.constraint(equalTo: createPlanView.rightAnchor, constant: -20),
         createPlanLabel.topAnchor.constraint(equalTo: createPlanView.topAnchor, constant: 10),
         createPlanLabel.bottomAnchor.constraint(equalTo: createPlanView.bottomAnchor, constant: -10)].forEach({$0.isActive = true})
    }
}


extension PaymentView: StackDataSource{
    var state: StateOfView {
        get {
            return currentState
        }
        set {
            self.currentState = newValue
        }
    }
    
    func heightOfHeaderView() -> CGFloat {
        return 48
    }
    
    
}
