//
//  FTSelectButton.swift
//  Fotile
//
//  Created by Chausson on 2017/11/13.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit

class FTSelectButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setTitleColor(UIColor.white, for: .selected)
        if self.tag == 1 {
            self.backgroundColor = RedColor
            self.layer.cornerRadius = 17.5
            self.isSelected = true
        }
        
        
    }
    override var isSelected: Bool{
        didSet{
            if isSelected {
                self.layer.cornerRadius = 17.5
                self.backgroundColor = RedColor
            }else{
                self.backgroundColor = UIColor.white
                self.layer.cornerRadius = 0
            }
        }
    }

}
