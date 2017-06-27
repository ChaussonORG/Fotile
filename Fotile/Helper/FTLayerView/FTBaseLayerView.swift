//
//  FTBaseLayerView.swift
//  Fotile
//
//  Created by 郭金涛 on 2017/5/24.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit

class FTBaseLayerView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(backImageView)
        addSubview(imageView1)
        addSubview(imageView2)
        addSubview(imageView3)
        addSubview(imageView4)
        addSubview(imageView5)
        addSubview(imageView6)
        addSubview(imageView7)
        addSubview(imageView8)
        addSubview(imageView9)
        addSubview(imageView10)
        backImageView.snp.makeConstraints { (make) in
            make.left.top.bottom.right.equalTo(0)
        }
        imageView1.snp.makeConstraints { (make) in
            make.left.top.bottom.right.equalTo(0)
        }
        imageView2.snp.makeConstraints { (make) in
            make.left.top.bottom.right.equalTo(0)
        }
        imageView3.snp.makeConstraints { (make) in
            make.left.top.bottom.right.equalTo(0)
        }
        imageView4.snp.makeConstraints { (make) in
            make.left.top.bottom.right.equalTo(0)
        }
        imageView5.snp.makeConstraints { (make) in
            make.left.top.bottom.right.equalTo(0)
        }
        imageView6.snp.makeConstraints { (make) in
            make.left.top.bottom.right.equalTo(0)
        }
        imageView7.snp.makeConstraints { (make) in
            make.left.top.bottom.right.equalTo(0)
        }
        imageView8.snp.makeConstraints { (make) in
            make.left.top.bottom.right.equalTo(0)
        }
        imageView9.snp.makeConstraints { (make) in
            make.left.top.bottom.right.equalTo(0)
        }
        imageView10.snp.makeConstraints { (make) in
            make.left.top.bottom.right.equalTo(10)
        }
    }
    func clear() {
        imageView1.image = nil
        imageView2.image = nil
        imageView3.image = nil
        imageView4.image = nil
        imageView5.image = nil
        imageView6.image = nil
        imageView7.image = nil
        imageView8.image = nil
        imageView9.image = nil
        imageView10.image = nil

    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    lazy var backImageView:UIImageView = {
        let imageV:UIImageView = UIImageView()
        imageV.backgroundColor = UIColor.white
        return imageV
    }()
    lazy var imageView1:UIImageView = {
        let imageV:UIImageView = UIImageView()
        return imageV
    }()
    lazy var imageView2:UIImageView = {
        let imageV:UIImageView = UIImageView()
        return imageV
    }()
    lazy var imageView3:UIImageView = {
        let imageV:UIImageView = UIImageView()
        return imageV
    }()
    lazy var imageView4:UIImageView = {
        let imageV:UIImageView = UIImageView()
        return imageV
    }()
    lazy var imageView5:UIImageView = {
        let imageV:UIImageView = UIImageView()
        return imageV
    }()
    lazy var imageView6:UIImageView = {
        let imageV:UIImageView = UIImageView()
        return imageV
    }()
    lazy var imageView7:UIImageView = {
        let imageV:UIImageView = UIImageView()
        return imageV
    }()
    lazy var imageView8:UIImageView = {
        let imageV:UIImageView = UIImageView()
        return imageV
    }()
    lazy var imageView9:UIImageView = {
        let imageV:UIImageView = UIImageView()
        return imageV
    }()
    lazy var imageView10:UIImageView = {
        let imageV:UIImageView = UIImageView()
        return imageV
    }()
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
