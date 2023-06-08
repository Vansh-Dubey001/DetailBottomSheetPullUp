//
//  StaffBlockView.swift
//  DetailBottomSheetPullUp
//
//  Created by Vansh Dubey on 07/06/23.
//

import UIKit

class StaffBlockView: UIView {
    public var button1Tapped: (()-> Void)?
    public var button2Tapped: (()-> Void)?
    public var button3Tapped: (()-> Void)?
    
    let col = UIColor(red: 102/255, green: 56/255, blue: 121/255, alpha: 1)

    @IBOutlet var outerview: UIView!

    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var assetIcon: UIImageView!
    @IBOutlet weak var numberIcon: UIImageView!
    @IBOutlet weak var groupIcon: UIImageView!
    
    @IBOutlet weak var groupLbl: UILabel!
    @IBOutlet weak var numberLbl: UILabel!
    @IBOutlet weak var assetLbl: UILabel!
    
    @IBOutlet weak var assetTimelineBtn: UIButton!
    @IBOutlet weak var assetTimelineUnderline: UIView!
    
    @IBOutlet weak var addAssetInfoBtn: UIButton!
    @IBOutlet weak var addAssetInfoUnderline: UIView!
    
    
    @IBOutlet weak var assetValueInfoBtn: UIButton!
    
    @IBOutlet weak var assetValueInfoUnderline: UIView!
    
    var currentTab: String = ""
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        Bundle.main.loadNibNamed("StaffBlockView", owner: self)
        self.outerview.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        
        assetIcon.image = UIImage(systemName: "checklist")
        numberIcon.image = UIImage(systemName: "ticket")
        groupIcon.image = UIImage(systemName: "ticket")
        
        self.assetTimelineUnderline.backgroundColor = col
        self.addAssetInfoUnderline.backgroundColor = .clear
        self.assetValueInfoUnderline.backgroundColor = .clear
        
        addSubview(outerview)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @IBAction func assetTimeline(_ sender: Any) {
        self.assetTimelineUnderline.backgroundColor = col
        self.addAssetInfoUnderline.backgroundColor = .clear
        self.assetValueInfoUnderline.backgroundColor = .clear
        button1Tapped?()
        print("cell1")
    }

    @IBAction func addAssetInfo(_ sender: Any) {
        self.assetTimelineUnderline.backgroundColor = .clear
        self.addAssetInfoUnderline.backgroundColor = col
        self.assetValueInfoUnderline.backgroundColor = .clear
        button2Tapped?()
        print("cell2")
    }

    @IBAction func assetValueInfo(_ sender: Any) {
        self.assetTimelineUnderline.backgroundColor = .clear
        self.addAssetInfoUnderline.backgroundColor = .clear
        self.assetValueInfoUnderline.backgroundColor = col
        button3Tapped?()
        print("cell 3")
    }
    
}


