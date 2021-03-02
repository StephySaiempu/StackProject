//
//  EMISelectionView.swift
//  StackProject
//
//  Created by Girira Stephy on 01/03/21.
//

import UIKit
import Stacks


class EMISelectionView: BaseView{
    
    var titleView: BaseView!
    var titleLabel: UILabel!
    var questionLabel: UILabel!
    var descriptionLabel: UILabel!
    var emiLabel: UILabel!
    var emiValueLabel: UILabel!
    var durationText: UILabel!
    var durationValuelabel: UILabel!
    var layout: UICollectionViewFlowLayout!
    var collectionView: UICollectionView!
    var createPlanView: BaseView!
    var createPlanLabel: UILabel!
    var modelArray = [EMIModel]()
    weak var navigationDelegate: NavigationProtocolForStack?
    
    public var currentState: StateOfView!{
        didSet{
            titleView.alpha = 0
            titleLabel.alpha = 0
            questionLabel.alpha = 0
            descriptionLabel.alpha = 0
            emiLabel.alpha = 0
            emiValueLabel.alpha = 0
            durationText.alpha = 0
            durationValuelabel.alpha = 0
            
            switch currentState {
            case .dismiss:
                titleView.alpha = 1
                titleLabel.alpha = 1
                break
            case .visible:
                questionLabel.alpha = 1
                descriptionLabel.alpha = 1
                break
            case .background:
                emiLabel.alpha = 1
                emiValueLabel.alpha = 1
                durationText.alpha = 1
                durationValuelabel.alpha = 1
                break
            default:
                break
            }
        }
    }
    var selectedModel: EMIModel?{
        didSet{
            self.emiValueLabel.text = selectedModel?.amountToBePaid
            self.durationValuelabel.text = selectedModel?.duration
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        titleView = BaseView.init(with: UIColor.ProjectTheme.ButtonColor, circular: false, shadow: false, borderColor: nil, borderThickness: nil)
        self.addSubview(titleView)
        
        titleLabel = UILabel()
        self.addSubview(titleLabel)
        titleLabel.text = "Proceed to EMI selection"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        
        questionLabel = UILabel()
        self.addSubview(questionLabel)
        questionLabel.text = "how do you wish to repay?"
        questionLabel.textColor = UIColor.ProjectTheme.TextColor
        questionLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        questionLabel.alpha = 0
        
        descriptionLabel = UILabel()
        self.addSubview(descriptionLabel)
        descriptionLabel.text = "choose one of our recommended plans or make your own"
        descriptionLabel.textColor = UIColor.ProjectTheme.TextColor
        descriptionLabel.numberOfLines = 3
        descriptionLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        descriptionLabel.alpha = 0
        
        emiLabel = UILabel()
        self.addSubview(emiLabel)
        emiLabel.text = "EMI"
        emiLabel.textColor = UIColor.ProjectTheme.TextColor
        emiLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        emiLabel.alpha = 0
        
        emiValueLabel = UILabel()
        self.addSubview(emiValueLabel)
        emiValueLabel.textColor = UIColor.ProjectTheme.TextColor
        emiValueLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        emiValueLabel.alpha = 0
        
        durationText = UILabel()
        self.addSubview(durationText)
        durationText.text = "duration"
        durationText.textColor = UIColor.ProjectTheme.TextColor
        durationText.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        durationText.alpha = 0
        
        durationValuelabel = UILabel()
        self.addSubview(durationValuelabel)
        durationValuelabel.textColor = UIColor.ProjectTheme.TextColor
        durationValuelabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        durationValuelabel.alpha = 0
        
        layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: 160, height: 170)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .horizontal
        
        collectionView = UICollectionView.init(frame: .zero, collectionViewLayout: layout)
        collectionView.register(EMICell.self, forCellWithReuseIdentifier: "emiIdentifier")
        self.addSubview(collectionView)
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.clipsToBounds = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        
        createPlanView = BaseView.init(with: UIColor(red: 0.09, green: 0.13, blue: 0.17, alpha: 1.00), circular: false, shadow: false, borderColor: UIColor.ProjectTheme.ButtonBorderColor, borderThickness: 3)
        self.addSubview(createPlanView)
        
        createPlanLabel = UILabel()
        self.addSubview(createPlanLabel)
        createPlanLabel.text = "Create your own plan"
        createPlanLabel.textColor = UIColor.ProjectTheme.ButtonBorderColor
        createPlanLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        createModel()
    }
    
    
    func createModel(){
        
        modelArray.append(EMIModel.init(amountToBePaid: "₹4,247/mo", duration: "for 12 months", selected: true, backgroundColor: UIColor.ProjectTheme.cellOneColor))
        modelArray.append(EMIModel.init(amountToBePaid: "₹5,580/mo", duration: "for 9 months", selected: false, backgroundColor: UIColor.ProjectTheme.cellTwoColor))
        modelArray.append(EMIModel.init(amountToBePaid: "₹8,250/mo", duration: "for 8 months", selected: false, backgroundColor: UIColor.ProjectTheme.cellThreeColor))
        selectedModel = modelArray[0]
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
        
        emiLabel.translatesAutoresizingMaskIntoConstraints = false
        [emiLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 14),
         emiLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20)].forEach({$0.isActive = true})
        
        emiValueLabel.translatesAutoresizingMaskIntoConstraints = false
        [emiValueLabel.topAnchor.constraint(equalTo: emiLabel.bottomAnchor, constant: 14),
         emiValueLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20)].forEach({$0.isActive = true})
        
        durationText.translatesAutoresizingMaskIntoConstraints = false
        [durationText.topAnchor.constraint(equalTo: self.topAnchor, constant: 14),
         durationText.leftAnchor.constraint(equalTo: self.centerXAnchor, constant: 20)].forEach({$0.isActive = true})
        
        durationValuelabel.translatesAutoresizingMaskIntoConstraints = false
        [durationValuelabel.topAnchor.constraint(equalTo: emiLabel.bottomAnchor, constant: 14),
         durationValuelabel.leftAnchor.constraint(equalTo: self.centerXAnchor, constant: 20)].forEach({$0.isActive = true})
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        [collectionView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
         collectionView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0),
         collectionView.heightAnchor.constraint(equalToConstant: 200),
         collectionView.topAnchor.constraint(equalTo: emiLabel.bottomAnchor, constant: 100)].forEach({$0.isActive = true})
        
        createPlanView.translatesAutoresizingMaskIntoConstraints = false
        [createPlanView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
         createPlanView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 20)].forEach({$0.isActive = true})
        
        createPlanLabel.translatesAutoresizingMaskIntoConstraints = false
        [createPlanLabel.leftAnchor.constraint(equalTo: createPlanView.leftAnchor, constant: 20),
         createPlanLabel.rightAnchor.constraint(equalTo: createPlanView.rightAnchor, constant: -20),
         createPlanLabel.topAnchor.constraint(equalTo: createPlanView.topAnchor, constant: 10),
         createPlanLabel.bottomAnchor.constraint(equalTo: createPlanView.bottomAnchor, constant: -10)].forEach({$0.isActive = true})
    }
}


extension EMISelectionView: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return modelArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "emiIdentifier", for: indexPath) as! EMICell
        cell.model = modelArray[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedModel = modelArray[indexPath.row]
    }
}


extension EMISelectionView: StackDataSource{
    var state: StateOfView {
        get {
            return currentState
        }
        set {
            self.currentState = newValue
        }
    }
    func heightOfHeaderView() -> CGFloat {
        return 96
    }
     
    
}
