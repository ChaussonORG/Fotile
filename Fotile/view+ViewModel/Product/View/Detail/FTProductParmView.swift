//
//  FTProductParmView.swift
//  Fotile
//
//  Created by Chausson on 2017/6/26.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit

class FTProductParmView: UIView {

    init(params:Array<FTProductParm>) {
         let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 135)
        super.init(frame: frame)

    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
