//
//  FTVerOptionsView.swift
//  Fotile
//
//  Created by 郭金涛 on 2017/5/10.
//  Copyright © 2017年 Gjt. All rights reserved.
//


import UIKit
protocol FTOptionEightViewDeleage {
    func clickBtnAction(index:Int)
}
class FTOptionEightView: UIView {
    var deleage:FTOptionEightViewDeleage?
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewModel.getData1()
        loadUI()
    }
    let viewModel:FTSliderViewModel = FTSliderViewModel()
    var spacing = (UIScreen.main.bounds.size.height - 560) / 9
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func loadUI() {
        let line:UIView = UIView()
        line.backgroundColor = FTStyleConfiguration.line
        addSubview(line)
        line.snp.makeConstraints { (make) in
            make.left.top.bottom.equalTo(0)
            make.width.equalTo(1)
        }
        var height:CGFloat = 0
        for i in 0..<viewModel.cellViewModles1.count {
            let model = viewModel.cellViewModles1[i]
            let label = UILabel()
            label.text = model.title
            label.numberOfLines = 0
            label.font = FTStyleConfiguration.font14
            addSubview(label)
            if model.isSele {
                label.textColor = FTStyleConfiguration.red
            }else{
                label.textColor = FTStyleConfiguration.b3b3b3
            }
            if i != 0 {
                let model1 = viewModel.cellViewModles1[i - 1]
                height += model1.spac
            }
            label.snp.makeConstraints({ (make) in
                make.top.equalTo(spacing * CGFloat(i + 1) + height)
                make.width.equalTo(22)
                make.left.equalTo(13)
            })
            
            let line:UIView = UIView()
            line.backgroundColor = FTStyleConfiguration.red
            addSubview(line)
            line.isHidden = !model.isSele
            line.snp.makeConstraints({ (make) in
                make.top.bottom.equalTo(label)
                make.left.equalTo(0)
                make.width.equalTo(2)
            })
            
            let btn:UIButton = UIButton(type: .custom)
            btn.tag = i
            btn.addTarget(self, action: #selector(sele), for: .touchUpInside)
            addSubview(btn)
            btn.snp.makeConstraints({ (make) in
                make.top.equalTo(label).offset(-spacing / 2)
                make.bottom.equalTo(label).offset(spacing / 2)
                make.width.equalTo(44)
                make.left.equalTo(0)
            })
        }
    }
    func sele(sender:UIButton) {
        for view in subviews {
            view.removeFromSuperview()
        }
        for i in 0..<viewModel.cellViewModles1.count {
            let model = viewModel.cellViewModles1[i]
            if i == sender.tag {
                model.isSele = true
            }else{
                model.isSele = false
            }
        }
        loadUI()
        deleage?.clickBtnAction(index: sender.tag)
        
    }
    func setDidIndex(index:Int)  {
        for view in subviews {
            view.removeFromSuperview()
        }
        for i in 0..<viewModel.cellViewModles1.count {
            let model = viewModel.cellViewModles1[i]
            if i == index {
                model.isSele = true
            }else{
                model.isSele = false
            }
        }
    }
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}

