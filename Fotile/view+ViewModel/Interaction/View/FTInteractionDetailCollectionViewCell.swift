//
//  FTInteractionDetailCollectionViewCell.swift
//  Fotile
//
//  Created by 郭金涛 on 2017/5/10.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit

class FTInteractionDetailCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadui()
    }
    func loadui() {
        addSubview(imageV)
        addSubview(label)

        imageV.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.top.equalTo(25)
            make.bottom.equalTo(-25)
        }
        label.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(15)
            make.bottom.equalTo(0)
        }
    }
    func loadModel(model:FTProduct)  {
        if let day2 = model.groupImage.day2{
            imageV.image = day2.picture
        }
        label.text = model.name
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    lazy var imageV:UIImageView = {
        let image:UIImageView = UIImageView()
        return image
    }()
    lazy var label:UILabel = {
        let label:UILabel = UILabel()
        label.textColor = FTStyleConfiguration.b3b3b3
        label.font = FTStyleConfiguration.font13
        label.textAlignment = .center
        return label
    }()
}
