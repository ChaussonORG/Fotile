//
//  FTGuideProgressView.swift
//  Fotile
//
//  Created by Chausson on 2017/11/10.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit

let RedColor:UIColor = UIColor(red: 255.0 / 255.0, green: 57.0 / 255.0, blue: 57.0 / 255.0, alpha: 1)
let GrayColor:UIColor = UIColor(red: 204.0 / 255.0, green: 204.0 / 255.0, blue: 204.0 / 255.0, alpha: 1)
let LightGrayColor:UIColor = UIColor(red: 77 / 255.0, green: 77 / 255.0, blue: 77 / 255.0, alpha: 1)
class FTGuideProgressView: UIView {
    let titles:Array<String> = ["户型选择","出水点","特色功能","所在省份"]
    var dots:Array<RedDot?> = Array()
    let disposeBag:DisposeBag = DisposeBag()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(realRed: 251, green: 249, blue: 249)
        self.addSubview(line)

        self.addSubview(continueBtn)

        layout()
        selectStage(0)

 
    }
    func layout() {
        let gap = 130
        for index in 0...3 {
            let dot:RedDot = RedDot()
            dot.title.text = titles[index]
            self.addSubview(dot)
            dots.append(dot)
            dot.snp.makeConstraints { (make) in
                make.centerY.equalTo(self.snp.centerY)
                make.left.equalTo(20+index*gap)
                make.width.equalTo(75)
                make.height.equalTo(75)
            }
        }
        let firstDot = dots[0]!
        let lastDot = dots[3]!
        line.snp.makeConstraints { (make) in
        make.right.equalTo(lastDot.snp.right).offset(-37.5)
        make.left.equalTo(firstDot.snp.left).offset(37.5)
            make.height.equalTo(2)
            make.centerY.equalTo(firstDot.dot.snp.centerY)
        }
        continueBtn.snp.makeConstraints { (make) in
            make.width.equalTo(120)
            make.height.equalTo(40)
            make.right.equalTo(-30)
            make.centerY.equalTo(self.snp.centerY)
        }
        
    }
    func bind() {


    }
    func selectStage(_ stage:Int) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [RedColor.cgColor, GrayColor.cgColor];
        gradientLayer.locations = [0.5, 1.0];
        
        gradientLayer.startPoint =   CGPoint(x: 0, y: 0)
        gradientLayer.endPoint =  CGPoint(x: 350, y: 0)
        gradientLayer.frame = CGRect(x:0,y: 0, width:stage*130, height:2);
        self.line.layer.addSublayer(gradientLayer);
        for index in 0...3 {
            if stage < index{
                continue
            }else{
                let d =  self.dots[index]
                d?.select.value = true
                if index == stage {
                    d?.title.textColor = RedColor
                }else{
                    d?.title.textColor = UIColor.lightGray

                }

            }
        }
  
    }
    lazy var continueBtn:UIButton = {
        let style = UIButton(type: .custom)
        style.layer.cornerRadius = 20
        style.layer.backgroundColor = RedColor.cgColor
        style.alpha = 1
        style.setTitle("继续", for: .normal)
        style.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        style.layer.shadowColor = RedColor.cgColor
        style.layer.shadowOpacity = 0.8
        style.layer.shadowOffset = CGSize(width: 0, height: 4.5)
        style.layer.shadowRadius = 4.75

        return style
    }()
    lazy var line:UIView = {

        let l = UIView()
        l.backgroundColor = GrayColor
        
        return l
    }()
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class RedDot:UIView {
    let disposeBag = DisposeBag()
    var select:Variable<Bool> = Variable(false)
    override init(frame: CGRect) {

        super.init(frame: frame)
        self.addSubview(dot)
        self.addSubview(title)
        bind()
    }

    lazy var title:UILabel = {
        let t = UILabel(frame: CGRect(x: 0, y: 5, width: 75, height: 30))
        t.textColor = UIColor.lightGray
        t.text = "户型选择"
        t.textAlignment = .center
        t.font = UIFont.systemFont(ofSize: 14)
        return t
    }()
    lazy var dot:UIView = {
        let d = UIView(frame: CGRect(x:27.5, y: 40, width: 20, height: 20))
        d.layer.cornerRadius = 10
        d.layer.masksToBounds = true
        d.backgroundColor = UIColor.white
        d.layer.borderColor = GrayColor.cgColor
        d.layer.borderWidth = 2
        return d
    }()
    func bind() {
        select.asObservable().subscribe(onNext: { [unowned self] isSelect in
            if isSelect == true {
                self.dot.backgroundColor = RedColor
                self.dot.layer.borderColor = RedColor.cgColor
            }else{
                self.dot.backgroundColor = UIColor.white
                self.dot.layer.borderColor = GrayColor.cgColor
            }
        }).addDisposableTo(disposeBag)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
