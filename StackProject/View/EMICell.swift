//
//  EMICell.swift
//  StackProject
//
//  Created by Girira Stephy on 01/03/21.
//

import UIKit
import Stacks

class EMICell: UICollectionViewCell{
    
    var installmentLabel: UILabel!
    var durationLabel: UILabel!
    var baseView: BaseView!
    var calculationsButton: UIButton!
    var selectedView: UIImageView!
    var circularView: BaseView!
    
    var model: EMIModel?{
        didSet{
            
            baseView.setColorToBaseView(color: model?.backgroundColor ?? UIColor.ProjectTheme.AppBackgroundColor)
            installmentLabel.text = model?.amountToBePaid ?? ""
            durationLabel.text = model?.duration ?? ""
            selectedView.alpha = (model?.selected ?? false) ? 1 : 0
        }
    }
    
    
    override var isSelected: Bool{
        didSet{
            selectedView.alpha = isSelected ? 1 : 0
            model?.selected = isSelected
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        baseView = BaseView.init(with: .white, circular: false, shadow: false, borderColor: nil, borderThickness: nil)
        self.addSubview(baseView)
        
        installmentLabel = UILabel()
        self.addSubview(installmentLabel)
        installmentLabel.numberOfLines = 2
        installmentLabel.lineBreakMode = .byTruncatingTail
        installmentLabel.textColor = .white
        installmentLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        
        durationLabel = UILabel()
        self.addSubview(durationLabel)
        durationLabel.numberOfLines = 2
        durationLabel.lineBreakMode = .byTruncatingTail
        durationLabel.font = UIFont.systemFont(ofSize: 13, weight: .light)
        durationLabel.textColor = .white
        
        calculationsButton = UIButton()
        self.addSubview(calculationsButton)
        calculationsButton.setTitle("see calculations", for: .normal)
        calculationsButton.setTitleColor(.white, for: .normal)
        calculationsButton.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .ultraLight)
        
        circularView = BaseView.init(with: .clear, circular: true, shadow: false, borderColor: UIColor.ProjectTheme.TextColor, borderThickness: 1)
        self.addSubview(circularView)
        
        selectedView = UIImageView()
        self.addSubview(selectedView)
        selectedView.image = UIImage.init(named: "selectedIcon")
        selectedView.alpha = 0
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        baseView.translatesAutoresizingMaskIntoConstraints = false
        [baseView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
         baseView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0),
         baseView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
         baseView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)].forEach({$0.isActive = true})
        
        installmentLabel.translatesAutoresizingMaskIntoConstraints = false
        [installmentLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8),
         installmentLabel.bottomAnchor.constraint(equalTo: self.centerYAnchor, constant: 0),
         installmentLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8)].forEach({$0.isActive  = true})
        
        durationLabel.translatesAutoresizingMaskIntoConstraints = false
        [durationLabel.leftAnchor.constraint(equalTo: installmentLabel.leftAnchor, constant: 0),
         durationLabel.topAnchor.constraint(equalTo: installmentLabel.bottomAnchor, constant: 4),
         durationLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16)].forEach({$0.isActive = true})
        
        
        calculationsButton.translatesAutoresizingMaskIntoConstraints = false
        [calculationsButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
         calculationsButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20)].forEach({$0.isActive = true})
        
        circularView.translatesAutoresizingMaskIntoConstraints = false
        [circularView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
         circularView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
         circularView.heightAnchor.constraint(equalToConstant: 30),
         circularView.widthAnchor.constraint(equalToConstant: 30)].forEach({$0.isActive = true})
        
        selectedView.translatesAutoresizingMaskIntoConstraints = false
        [selectedView.centerYAnchor.constraint(equalTo: circularView.centerYAnchor, constant: 0),
         selectedView.centerXAnchor.constraint(equalTo: circularView.centerXAnchor, constant: 0)].forEach({$0.isActive = true})
         [selectedView.heightAnchor.constraint(equalToConstant: 20),
         selectedView.widthAnchor.constraint(equalToConstant: 20)].forEach({$0.isActive = true})
    }
}
