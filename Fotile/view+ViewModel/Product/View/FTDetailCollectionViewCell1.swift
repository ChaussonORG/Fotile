//
//  FTDetailCollectionViewCell1.swift
//  Fotile
//
//  Created by 郭金涛 on 2017/5/21.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit

class FTDetailCollectionViewCell1: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageV)
        imageV.snp.makeConstraints { (make) in
            make.left.equalTo(50)
            make.right.equalTo(50)
            make.top.bottom.equalTo(0)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    lazy var imageV:UIImageView = {
        let imageV:UIImageView = UIImageView()
        imageV.image = #imageLiteral(resourceName: "home6")
        return imageV
    }()
}
