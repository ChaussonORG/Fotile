//
//  FTScreeningTableViewCell.swift
//  Fotile
//
//  Created by 郭金涛 on 2017/5/23.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit

protocol FTScreeningTableViewCellDeleage {
    func didSeletecedAction(row:Int,section:Int)
}
class FTScreeningTableViewCell: UITableViewCell {

    var deleage:FTScreeningTableViewCellDeleage?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        clipsToBounds = true
        selectionStyle = .none
    }
    var section = 0
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func loadUI(model:FTScreeningCellViewModel, section:Int){
        let chilrenviews = contentView.subviews
        for chilren in chilrenviews {
            chilren.removeFromSuperview()
        }
        self.section = section
        let spac = (UIScreen.main.bounds.size.width - 100) / 5
        for i in 0..<model.items.count {
            let btn:UIButton = UIButton()
            btn.setTitleColor(FTStyleConfiguration.d4d4d4, for: .normal)
            btn.tag = i
            btn.addTarget(self, action: #selector(seletecedAction), for: .touchUpInside)
            contentView.addSubview(btn)
            btn.snp.makeConstraints({ (make) in
                make.left.equalTo(50 + spac * CGFloat(i % 5))
                make.top.equalTo(i / 5 * 30 + i / 5 * 40)
                make.width.equalTo(spac)
                make.height.equalTo(30)
            })
            let redBtn = UIButton()
            redBtn.backgroundColor = FTStyleConfiguration.red
            redBtn.layer.masksToBounds = true
            redBtn.layer.cornerRadius = 13
            redBtn.tag = i
            redBtn.isHidden = !model.items[i].isSelected
            redBtn.addTarget(self, action: #selector(seletecedAction), for: .touchUpInside)
            btn.addSubview(redBtn)
            
            let label = UILabel()
            label.text = model.items[i].title
            label.textColor = FTStyleConfiguration.d4d4d4
            label.font = FTStyleConfiguration.font14
            if model.items[i].isSelected {
                label.textColor = UIColor.white
            }
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
    func seletecedAction(sender:UIButton)  {
        deleage?.didSeletecedAction(row: sender.tag, section: section)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
