
//
//  FTAreaScreeningView.swift
//  Fotile
//
//  Created by 郭金涛 on 2017/5/24.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit
protocol FTScreeningCostAndAreaViewDeleage {
    func didSeletecedActionAreaCost(screenView:FTScreeningCostAndAreaView,title:String)
}
class FTScreeningCostAndAreaView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        clipsToBounds = true
    }
    var dele:FTScreeningCostAndAreaViewDeleage?
    var titleString:String = ""
    var  cellViewModels:[FTScreeningCellViewModelAreaAndCost] = [FTScreeningCellViewModelAreaAndCost]()
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func loadUI(cellViewModels:[FTScreeningCellViewModelAreaAndCost]){
        self.cellViewModels = cellViewModels
        let chilrenviews = subviews
        for chilren in chilrenviews {
            chilren.removeFromSuperview()
        }
        let spac = (UIScreen.main.bounds.size.width - 100) / 5
        for i in 0..<cellViewModels.count {
            let btn:UIButton = UIButton()
            btn.setTitleColor(FTStyleConfiguration.d4d4d4, for: .normal)
            btn.tag = i
            btn.addTarget(self, action: #selector(seletecedAction), for: .touchUpInside)
            addSubview(btn)
            btn.snp.makeConstraints({ (make) in
                make.left.equalTo(50 + spac * CGFloat(i % 5))
                make.top.equalTo(50)
                make.width.equalTo(spac)
                make.height.equalTo(30)
            })
            let redBtn = UIButton()
            redBtn.backgroundColor = FTStyleConfiguration.red
            redBtn.layer.masksToBounds = true
            redBtn.layer.cornerRadius = 13
            redBtn.tag = i
            redBtn.isHidden = !cellViewModels[i].isSelected
            redBtn.addTarget(self, action: #selector(seletecedAction), for: .touchUpInside)
            btn.addSubview(redBtn)
            
            let label = UILabel()
            label.text = cellViewModels[i].title
            label.textColor = FTStyleConfiguration.d4d4d4
            if cellViewModels[i].isSelected {
                label.textColor = UIColor.white
            }
            label.font = FTStyleConfiguration.font14
            btn.addSubview(label)
            label.snp.makeConstraints({ (make) in
                make.left.equalTo(10)
                make.top.bottom.equalTo(0)
            })
            
            
            redBtn.snp.makeConstraints({ (make) in
                make.left.equalTo(0)
                make.top.bottom.equalTo(0)
                make.right.equalTo(label).offset(10)
            })
        }
    }

    func seletecedAction(sender:UIButton) {
        for i in 0..<cellViewModels.count{
            let model = cellViewModels[i]
            if i == sender.tag {
                model.isSelected = !model.isSelected
                titleString = model.title
            }else{
                model.isSelected = false
            }
        }
        dele?.didSeletecedActionAreaCost(screenView: self, title: titleString)
        loadUI(cellViewModels: cellViewModels)
    }

}
