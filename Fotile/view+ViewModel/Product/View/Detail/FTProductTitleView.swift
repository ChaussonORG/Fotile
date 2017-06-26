//
//  FTProductTitleView.swift
//  Fotile
//
//  Created by Chausson on 2017/6/26.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit

class FTProductTitleView: UIView {
 

    override init(frame: CGRect) {
        super.init(frame: frame)

    }
    init(frame: CGRect,title:String?,subTitle:String?,desc:String?) {
        super.init(frame: frame)
        self.addSubview(titleLabel)
        self.addSubview(subTitleLabel)
        self.addSubview(descLabel)

        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(25)
            make.left.equalTo(50)
            make.height.equalTo(30)
        }
        subTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.top)
            make.left.equalTo(titleLabel.snp.right).offset(5)
            make.height.equalTo(30)
        }
        descLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.left.equalTo(50)
            make.height.equalTo(30)
        }
        
        if let t = title{
            titleLabel.text = "\(t) · "
        }
        if let s = subTitle{
            subTitleLabel.text = s
        }
        if let d = desc{
            descLabel.text = d
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    lazy var titleLabel:UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = UIColor.black
        titleLabel.numberOfLines = 1;//根据最大行数需求来设置
        let size = CGSize(width: 250, height: 30)
        titleLabel.font = UIFont.systemFont(ofSize: 30)
        titleLabel.sizeThatFits(size)

        return titleLabel
    }()
    lazy var subTitleLabel:UILabel = {
        let subTitle = UILabel()
        subTitle.textColor = UIColor("#808080")
        subTitle.numberOfLines = 1;//根据最大行数需求来设置
        let size = CGSize(width: 200, height: 30)
        subTitle.font = UIFont.boldSystemFont(ofSize: 30)
        subTitle.sizeThatFits(size)
        
        return subTitle
    }()
    lazy var descLabel:UILabel = {
        let desc = UILabel()
        desc.textColor = UIColor("#808080")
        desc.numberOfLines = 1;//根据最大行数需求来设置
        let size = CGSize(width: 100, height: 30)
        desc.font = UIFont.systemFont(ofSize: 22)
        desc.sizeThatFits(size)
        
        return desc
    }()
 
}
