

//
//  FTOptionsView.swift
//  Fotile
//
//  Created by 郭金涛 on 2017/5/10.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit

protocol FTHorOptionsViewDeleage {
    func clickBtnAction(index:Int32)
}
class FTHorOptionsView: UIView {
    var deleage:FTHorOptionsViewDeleage?
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadUI()
    }
    
    let viewModel:FTSliderViewModel = FTSliderViewModel()
    var spacing = (UIScreen.main.bounds.size.width - 560) / 10
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func loadUI() {
        let line:UIView = UIView()
        line.backgroundColor = FTStyleConfiguration.line
        addSubview(line)
        line.snp.makeConstraints { (make) in
            make.left.bottom.right.equalTo(0)
            make.height.equalTo(1)
        }
        var height:CGFloat = 0
        for i in 0..<viewModel.cellViewModles.count {
            let model = viewModel.cellViewModles[i]
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
                let model1 = viewModel.cellViewModles[i - 1]
                height += model1.spac
            }
            label.snp.makeConstraints({ (make) in
                make.top.equalTo(11)
                make.height.equalTo(22)
                make.left.equalTo(spacing * CGFloat(i + 1) + height)
            })
            
            let line:UIView = UIView()
            line.backgroundColor = FTStyleConfiguration.red
            addSubview(line)
            line.isHidden = !model.isSele
            line.snp.makeConstraints({ (make) in
                make.left.right.equalTo(label)
                make.bottom.equalTo(0)
                make.height.equalTo(2)
            })
            
            let btn:UIButton = UIButton(type: .custom)
            btn.tag = i + 1
            btn.addTarget(self, action: #selector(sele), for: .touchUpInside)
            addSubview(btn)
            btn.snp.makeConstraints({ (make) in
                make.left.equalTo(label).offset(-spacing / 2)
                make.right.equalTo(label).offset(spacing / 2)
                make.height.equalTo(44)
                make.top.equalTo(0)
            })
        }
    }
    func sele(sender:UIButton) {
        for view in subviews {
            view.removeFromSuperview()
        }
        for i in 0..<viewModel.cellViewModles.count {
            let model = viewModel.cellViewModles[i]
            if i == (sender.tag - 1) {
                model.isSele = true
            }else{
                model.isSele = false
            }
        }
        loadUI()
        deleage?.clickBtnAction(index: Int32(sender.tag))
    }
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}

