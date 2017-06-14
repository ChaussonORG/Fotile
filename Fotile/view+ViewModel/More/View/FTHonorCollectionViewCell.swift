//
//  FTHonorCollectionViewCell.swift
//  Fotile
//
//  Created by 郭金涛 on 2017/6/1.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit

class FTHonorCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadui()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func loadui() {
        addSubview(imageV)
        imageV.snp.makeConstraints { (make) in
            make.left.right.top.equalTo(0)
            make.bottom.equalTo(0)
        }

    }
    lazy var imageV:UIImageView = {
        let imageV:UIImageView = UIImageView()
        imageV.layer.borderColor = FTStyleConfiguration.e6e6e6.cgColor
        imageV.layer.borderWidth = 1
        //imageV.image = #imageLiteral(resourceName: "WBZL-4")
        return imageV
    }()
}
