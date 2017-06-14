//
//  FTPentalCollectionViewCell.swift
//  Fotile
//
//  Created by 郭金涛 on 2017/6/1.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit

class FTPentalCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadui()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func loadui() {
        addSubview(imageV)
        addSubview(label)
        imageV.snp.makeConstraints { (make) in
            make.left.right.top.equalTo(0)
            make.bottom.equalTo(-40)
        }
        label.snp.makeConstraints { (make) in
            make.left.bottom.right.equalTo(0)
            make.top.equalTo(imageV.snp.bottom).offset(0)
        }
    }
    lazy var imageV:UIImageView = {
        let imageV:UIImageView = UIImageView()
        imageV.layer.borderColor = FTStyleConfiguration.e6e6e6.cgColor
        imageV.layer.borderWidth = 1
        imageV.image = #imageLiteral(resourceName: "zhengshu")
        return imageV
    }()
    lazy var label:UILabel = {
        let label:UILabel = UILabel()
        label.text = "吸油烟机红外感应"
        label.font = FTStyleConfiguration.font14
        label.textColor = FTStyleConfiguration.black
        label.textAlignment = .center
        return label
    }()
}
