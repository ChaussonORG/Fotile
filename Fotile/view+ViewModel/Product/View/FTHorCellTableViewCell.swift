//
//  FTHorCellTableViewCell.swift
//  Fotile
//
//  Created by 郭金涛 on 2017/6/28.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit

class FTHorCellTableViewCell: UITableViewCell {

    @IBOutlet var type: UILabel!
    @IBOutlet var typeName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func loadModel(model:FTProductParm){
        type.text = model.title
        typeName.text = model.content
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
