
//
//  FTSceneryCollectionCell.swift
//  Fotile
//
//  Created by 郭金涛 on 2017/5/15.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit

class FTSceneryCollectionCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadui()
    }
    func loadui() {
        //backgroundColor = FTStyleConfiguration.line
        addSubview(imageV)
        addSubview(areaNum)
        addSubview(area)
        addSubview(costNum)
        addSubview(cost)

        imageV.snp.makeConstraints { (make) in
            make.left.equalTo(25)
            make.right.equalTo(-9)
            make.top.equalTo(25)
            make.bottom.equalTo(-65)
        }
        areaNum.snp.makeConstraints { (make) in
            make.left.equalTo(imageV)
            make.top.equalTo(imageV.snp.bottom).offset(15)
            make.bottom.equalTo(-30)
        }
        area.snp.makeConstraints { (make) in
            make.left.equalTo(areaNum.snp.right).offset(5)
            make.top.equalTo(areaNum)
            make.bottom.equalTo(-27)
        }
        costNum.snp.makeConstraints { (make) in
            make.left.equalTo(area.snp.right).offset(60)
            make.top.equalTo(areaNum)
            make.bottom.equalTo(areaNum)
        }
        cost.snp.makeConstraints { (make) in
            make.left.equalTo(costNum.snp.right).offset(5)
            make.top.equalTo(areaNum)
            make.bottom.equalTo(area)
        }
    }
    func loadModel(model:FTRealKitchen) {
        if  let area =  model.kitchenArea{
            areaNum.text = "\(area)平米"

        }
        if  let cost =  model.fotileCost{
            costNum.text = "\(cost)万"
            
        }
        if  let p =  model.thumbnailImage{
            imageV.image = p.picture
            
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    lazy var imageV:UIImageView = {
        let image:UIImageView = UIImageView()
        return image
    }()
    lazy var areaNum:UILabel = {
        let label:UILabel = UILabel()
        label.textColor = FTStyleConfiguration.a4c4c4c
        label.font = FTStyleConfiguration.font18bold
        return label
    }()
    lazy var area:UILabel = {
        let label:UILabel = UILabel()
        label.text = "厨房面积"
        label.textColor = FTStyleConfiguration.black
        label.font = FTStyleConfiguration.font14
        return label
    }()

    lazy var costNum:UILabel = {
        let label:UILabel = UILabel()
        label.textColor = FTStyleConfiguration.a4c4c4c
        label.font = FTStyleConfiguration.font18bold
        return label
    }()

    lazy var cost:UILabel = {
        let label:UILabel = UILabel()
        label.text = "厨电成本"
        label.textColor = FTStyleConfiguration.black
        label.font = FTStyleConfiguration.font14
        return label
    }()

}
