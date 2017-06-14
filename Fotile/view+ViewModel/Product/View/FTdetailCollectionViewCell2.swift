//
//  FTdetailCollectionViewCell2.swift
//  Fotile
//
//  Created by 郭金涛 on 2017/5/21.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit

class FTdetailCollectionViewCell2: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageV)
        addSubview(label1)
        addSubview(label2)
        imageV.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.top.equalTo(0)
            make.height.equalTo(130)
            //make.bottom.equalTo(-50)
        }
        label1.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.top.equalTo(imageV.snp.bottom).offset(5)
            make.height.equalTo(20)
        }
        label2.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.top.equalTo(label1.snp.bottom).offset(0)
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
    lazy var label1:UILabel = {
        let label:UILabel = UILabel()
        label.text = "嵌入式油烟机"
        label.textColor = FTStyleConfiguration.d4d4d4
        label.font = FTStyleConfiguration.font18
        return label
    }()
    lazy var label2:UILabel = {
        let label:UILabel = UILabel()
        label.text = "EEAD-1230EWQEQ"
        label.font = FTStyleConfiguration.font17
        label.textColor = FTStyleConfiguration.black
        return label
    }()
    
    
}
