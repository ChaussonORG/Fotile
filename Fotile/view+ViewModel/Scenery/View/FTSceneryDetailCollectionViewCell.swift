//
//  FTSceneryDetailCollectionViewCell.swift
//  Fotile
//
//  Created by 郭金涛 on 2017/5/15.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit

class FTSceneryDetailCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)
        addSubview(titleLabel1)
        addSubview(titleLabel2)
        titleLabel.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(25)
        }
        titleLabel1.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
        }
        titleLabel2.snp.makeConstraints { (make) in
            make.right.equalTo(0)
            make.width.height.equalTo(10)
            make.top.equalTo(37.5)
        }
    }
    func loadString(str:String, str1:String) {
        titleLabel.text = str
        titleLabel1.text = str1
    }
    lazy var titleLabel:UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.font = FTStyleConfiguration.font17bold
        label.textColor = FTStyleConfiguration.d4d4d4
        return label
    }()
    lazy var titleLabel1:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = FTStyleConfiguration.font12
        label.textColor = FTStyleConfiguration.b3b3b3
        return label
    }()
    lazy var titleLabel2:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = FTStyleConfiguration.font22
        label.textColor = FTStyleConfiguration.d4d4d4
        label.text = "·"
        return label
    }()
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

