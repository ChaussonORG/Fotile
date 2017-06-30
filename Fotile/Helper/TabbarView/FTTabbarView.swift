//
//  FTTabbarView.swift
//  Fotile
//
//  Created by 郭金涛 on 2017/4/25.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit

class FTTabbarView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        btn1.isSelected = true
        addSubview(stackView)
        view1.addSubview(btn1)
        view2.addSubview(btn2)
        view3.addSubview(btn3)
        view4.addSubview(btn4)
       // stackView.arrangedSubviews = [btn1,btn2,btn3, btn4]
    
        stackView.snp.makeConstraints { (make) in
            make.left.bottom.right.equalTo(0)
            make.height.equalTo(55)
        }
        btn1.snp.makeConstraints { (make) in
            make.left.right.bottom.top.equalTo(0)
        }
        btn2.snp.makeConstraints { (make) in
            make.left.right.bottom.top.equalTo(0)
        }
        btn3.snp.makeConstraints { (make) in
            make.left.right.bottom.top.equalTo(0)
        }
        btn4.snp.makeConstraints { (make) in
            make.left.right.bottom.top.equalTo(0)
        }

        stackView.backgroundColor = UIColor.red
        addSubview(line)
        line.snp.makeConstraints { (make) in
            make.left.right.top.equalTo(0)
            make.height.equalTo(1)
        }
    }
    lazy var stackView:UIStackView = {
        let stackView:UIStackView = UIStackView(arrangedSubviews: [self.view1,self.view2,self.view3,self.view4])
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        return stackView
    }()
    lazy var view1:UIView = {
        let view:UIView = UIView()
        return view
    }()
    lazy var view2:UIView = {
        let view:UIView = UIView()
        return view
    }()
    lazy var view3:UIView = {
        let view:UIView = UIView()
        return view
    }()
    lazy var view4:UIView = {
        let view:UIView = UIView()
        return view
    }()
    
    lazy var line:UIView = {
        let view:UIView = UIView()
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    lazy var btn1:UIButton = {
        let btn:UIButton = UIButton(type: .custom)
        btn.setImage(#imageLiteral(resourceName: "home"), for: .normal)
        btn.setImage(#imageLiteral(resourceName: "home_1"), for: .selected)
        btn.setTitle("定制厨房", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 8, 0, 0)
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 12, 0, 0)
        btn.setTitleColor(FTStyleConfiguration.red, for: .selected)
        btn.setTitleColor(FTStyleConfiguration.lightGray, for: .normal)
        btn.addTarget(self, action: #selector(action1), for: .touchUpInside)
        return btn
    }()
    lazy var btn2:UIButton = {
        let btn:UIButton = UIButton(type: .custom)
        btn.setImage(#imageLiteral(resourceName: "activity"), for: .normal)
        btn.setImage(#imageLiteral(resourceName: "activity_1"), for: .selected)
        btn.setTitle("实景厨房", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 12, 0, 0)
        btn.setTitleColor(FTStyleConfiguration.red, for: .selected)
        btn.setTitleColor(FTStyleConfiguration.lightGray, for: .normal)
        btn.addTarget(self, action: #selector(action2), for: .touchUpInside)
        return btn
    }()
    lazy var btn3:UIButton = {
        let btn:UIButton = UIButton(type: .custom)
        btn.setImage(#imageLiteral(resourceName: "circle"), for: .normal)
        btn.setImage(#imageLiteral(resourceName: "circle_1"), for: .selected)
        btn.setTitle("产品信息", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 12, 0, 0)
        btn.setTitleColor(FTStyleConfiguration.red, for: .selected)
        btn.setTitleColor(FTStyleConfiguration.lightGray, for: .normal)
        btn.addTarget(self, action: #selector(action3), for: .touchUpInside)
        return btn
    }()
    lazy var btn4:UIButton = {
        let btn:UIButton = UIButton(type: .custom)
        btn.setImage(#imageLiteral(resourceName: "me"), for: .normal)
        btn.setImage(#imageLiteral(resourceName: "me_1"), for: .selected)
        btn.setTitle("你还需要", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 12, 0, 0)
        btn.setTitleColor(FTStyleConfiguration.red, for: .selected)
        btn.setTitleColor(FTStyleConfiguration.lightGray, for: .normal)
        btn.addTarget(self, action: #selector(action4), for: .touchUpInside)
        return btn
    }()
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func action1()  {
        (UIApplication.shared.delegate as! AppDelegate).tabbar?.selectedIndex = 0
        btn1.isSelected = true
        btn2.isSelected = false
        btn3.isSelected = false
        btn4.isSelected = false
    }
    func action2()  {
        (UIApplication.shared.delegate as! AppDelegate).tabbar?.selectedIndex = 1
        btn1.isSelected = false
        btn2.isSelected = true
        btn3.isSelected = false
        btn4.isSelected = false
    }
    func action3()  {
        (UIApplication.shared.delegate as! AppDelegate).tabbar?.selectedIndex = 2
        btn1.isSelected = false
        btn2.isSelected = false
        btn3.isSelected = true
        btn4.isSelected = false
    }
    func action4()  {
        (UIApplication.shared.delegate as! AppDelegate).tabbar?.selectedIndex = 3
        btn1.isSelected = false
        btn2.isSelected = false
        btn3.isSelected = false
        btn4.isSelected = true
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
