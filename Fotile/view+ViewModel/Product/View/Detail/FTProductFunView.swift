//
//  FTProductFunView.swift
//  Fotile
//
//  Created by Chausson on 2017/6/27.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit

class FTProductFunView: UIView {
    let tapView:UIView = UIView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(line)
        addSubview(title)
        addSubview(content)
        addSubview(row)
        addSubview(tapView)

        line.snp.makeConstraints { (make) in
            make.top.equalTo(50);
            make.left.equalTo(50);
            make.right.equalTo(-50);
            make.height.equalTo(1);
        }
        title.snp.makeConstraints { (make) in
            make.top.equalTo(line.snp.bottom).offset(50);
            make.left.equalTo(50);
            make.width.equalTo(200);
            make.height.equalTo(30);
        }
        content.snp.makeConstraints { (make) in
            make.top.equalTo(title.snp.bottom).offset(10);
            make.left.equalTo(50);
            make.width.equalTo(400);
            make.height.equalTo(30);
        }
        row.snp.makeConstraints { (make) in
            make.top.equalTo(title).offset(10);
            make.right.equalTo(-50);
            make.width.height.equalTo(24);
        }
        tapView.snp.makeConstraints { (make) in
            make.top.equalTo(100);
            make.left.equalTo(50);
            make.right.equalTo(-50);
            make.height.equalTo(50);
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    lazy var line:UIView = {
        let line = UIView()
        line.backgroundColor = UIColor("#E7E7E7")
        return line
    }()
    lazy var row:UIImageView = {
        let row = UIImageView(image: UIImage(named: "more"))
        
        
        return row
    }()
    lazy var title:UILabel = {
        let title = UILabel()
        title.textColor = UIColor.black
        title.font = UIFont.boldSystemFont(ofSize: 22)
        title.text = "厨fun研究所"

        return title
    }()
    lazy var content:UILabel = {
        let content = UILabel()
        content.textColor = UIColor("#808080")
        content.font = UIFont.systemFont(ofSize: 18)
        content.text = "了解更多油烟机安装、清洗、保养知识"

        return content
    }()
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
}
