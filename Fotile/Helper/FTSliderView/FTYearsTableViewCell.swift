//
//  FTYearsTableViewCell.swift
//  Fotile
//
//  Created by 郭金涛 on 2017/6/3.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit

class FTYearsTableViewCell: UITableViewCell {

    @IBOutlet var title: UILabel!
    @IBOutlet var redView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        title.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI / 2))
        // Initialization code
    }
    func loadModel(model:FTSliderCellViewModel) {
        title.text = model.title
        if model.isSele  {
            redView.isHidden = false
            title.textColor = FTStyleConfiguration.red
        }else{
            redView.isHidden = true
            title.textColor = FTStyleConfiguration.bbbbbb
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
