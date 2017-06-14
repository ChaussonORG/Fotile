//
//  FTDetailCollectionViewCell3.swift
//  Fotile
//
//  Created by 郭金涛 on 2017/5/21.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit

class FTDetailCollectionViewCell3: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageV)
        addSubview(label2)
        imageV.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.top.equalTo(0)
            make.height.equalTo(130)
            //make.bottom.equalTo(-50)
        }

        label2.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.top.equalTo(imageV.snp.bottom).offset(5)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    lazy var imageV:UIImageView = {
        let imageV:UIImageView = UIImageView()
        imageV.image = #imageLiteral(resourceName: "home2")
        return imageV
    }()
    lazy var label2:UILabel = {
        let label:UILabel = UILabel()
        label.text = "EEAD-1230EWQEQ"
        label.font = FTStyleConfiguration.font17
        label.textColor = FTStyleConfiguration.black
        return label
    }()
    
}
