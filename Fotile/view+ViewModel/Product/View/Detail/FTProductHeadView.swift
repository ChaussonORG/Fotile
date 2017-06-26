//
//  FTProductHeadView.swift
//  Fotile
//
//  Created by Chausson on 2017/6/26.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit

class FTProductHeadView: UIView {
    var headTitles:Array<String>?
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    init(title:String) {
        let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 140)
       super.init(frame: frame)
        self.addSubview(line)
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(-20)
            make.left.equalTo(50)
            make.right.equalTo(-50)
            make.height.equalTo(30)
        }
        line.snp.makeConstraints { (make) in
            make.top.equalTo(50)
            make.left.equalTo(50)
            make.right.equalTo(-50)
            make.height.equalTo(1)
        }
    
        titleLabel.text = title
    }
    func setupHeaders(heads:Array<String>) {
        headTitles = heads
        self.addSubview(currentNumber)
        self.addSubview(total)
        total.snp.makeConstraints { (make) in
            make.bottom.equalTo(-20)
            make.width.equalTo(20)
            make.right.equalTo(-50)
            make.height.equalTo(30)
        }
        currentNumber.snp.makeConstraints { (make) in
            make.bottom.equalTo(-20)
            make.width.equalTo(20)
            make.right.equalTo(total.snp.left).offset(0)
            make.height.equalTo(30)
        }
        currentNumber.text = "1"
        titleLabel.text = heads[0]

        total.text = "/\(heads.count)"
    }
    func changeHead(index:Int) {
        if (headTitles?.count)! >= index {
            guard let title = headTitles?[index] else {
                return
            }
            titleLabel.text = title
            currentNumber.text = "\(index+1)"
        }
  
        
    }
    lazy var currentNumber:UILabel = {
        let currentNumber = UILabel()
        currentNumber.textColor = UIColor.black
        currentNumber.font = UIFont.systemFont(ofSize: 22)
        return currentNumber
    }()
    lazy var total:UILabel = {
        let total = UILabel()
        total.textColor = UIColor("#808080")
        total.font = UIFont.systemFont(ofSize: 18)

        return total
    }()
    lazy var line:UIView = {
        let line = UIView()
        line.backgroundColor = UIColor("#E7E7E7")
        return line
    }()
    lazy var titleLabel:UILabel = {
       let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 22)
        title.textColor = UIColor.black
       return title
    }()
}
