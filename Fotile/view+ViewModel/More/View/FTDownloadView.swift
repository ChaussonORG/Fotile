//
//  FTDownloadView.swift
//  Fotile
//
//  Created by 郭金涛 on 2017/6/20.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit

class FTDownloadView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadui()
    }
    var againDownloadBlock:(()->Void)?
    class func share() -> FTDownloadView{
        let view:FTDownloadView = FTDownloadView(frame: CGRect.init(x: 0, y: 0, width: UIScreen.width, height: UIScreen.height))
        return view
    }
    func loadui(){
        addSubview(blackView)
        addSubview(whiteView)
        whiteView.addSubview(number)
        whiteView.addSubview(message)
        whiteView.addSubview(label)
        whiteView.addSubview(againBtn)
//        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(againDownLoad))
//        message.addGestureRecognizer(tap)
        blackView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
        whiteView.snp.makeConstraints { (make) in
            make.width.equalTo(400)
            make.height.equalTo(200)
            make.center.equalTo(self.center)
        }
        number.snp.makeConstraints { (make) in
            make.centerX.equalTo(200)
            make.height.equalTo(40)
            make.top.equalTo(55)
        }
        label.snp.makeConstraints { (make) in
            make.left.equalTo(number.snp.right).offset(5)
            make.height.equalTo(15)
            make.top.equalTo(83)
        }

        message.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(number.snp.bottom).offset(25)
            make.height.equalTo(15)
        }
        againBtn.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(number.snp.bottom).offset(20)
            make.height.equalTo(25)
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var blackView:UIView = {
        let view:UIView = UIView()
        view.backgroundColor = UIColor.black
        view.alpha = 0.4
        return view
    }()
    
    lazy var whiteView:UIView = {
        let view:UIView = UIView()
        view.backgroundColor = UIColor.white
//        view.layer.masksToBounds = true
//        view.layer.cornerRadius = 5
        return view
    }()
    lazy var number:UILabel = {
        let label:UILabel = UILabel()
        label.textColor = FTStyleConfiguration.red
        label.font = UIFont.boldSystemFont(ofSize: 50)
        label.textAlignment = .center
        label.text = "0"
        return label
    }()
    
    lazy var againBtn:UIButton = {
        let btn:UIButton = UIButton()
        btn.setTitle("继续下载", for: .normal)
        btn.backgroundColor = UIColor.white
        btn.setTitleColor(FTStyleConfiguration.red, for: .normal)
        btn.isHidden = true
        btn.titleLabel?.font = FTStyleConfiguration.font14
        btn.addTarget(self, action: #selector(againDownLoad), for: .touchUpInside)
        return btn
    }()
    
    lazy var label:UILabel = {
        let label:UILabel = UILabel()
        label.textColor = FTStyleConfiguration.red
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        label.text = "%"
        return label
    }()
    lazy var message:UILabel = {
        let label:UILabel = UILabel()
        label.textColor = FTStyleConfiguration.black
        label.text = "离线素材更新中..."
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        return label
    }()
    func show() {
        number.text = "0"
        label.isHidden = false
        UIApplication.shared.keyWindow?.addSubview(self)
    }
    func hide(){
        self.removeFromSuperview()
    }
    func againDownLoad(){
        self.againDownloadBlock!()
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
