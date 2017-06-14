//
//  FTInteractionTableViewCell.swift
//  Fotile
//
//  Created by 郭金涛 on 2017/5/2.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit

class FTInteractionTableViewCell: UITableViewCell {

    @IBOutlet var imageV: UIImageView!
    @IBOutlet var title: UILabel!
    @IBOutlet var tag1: UILabel!
    @IBOutlet var tag2: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        imageV.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(-100)
            make.height.equalTo(490)
            //make.top.lessThanOrEqualTo(-200)
        }
        // Initialization code
    }
    func loadModel(model:FTCustomKitchen) {
        imageV.image = model.image.picture
        title.text = model.name
        tag1.text = model.tag1
        tag2.text = model.tag2
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
