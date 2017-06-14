//
//  FTProductTableViewCell.swift
//  Fotile
//
//  Created by 郭金涛 on 2017/5/9.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit

protocol FTProductTableViewCellDeleage {
    func reload()
    func moreAction()
}
class FTProductTableViewCell: UITableViewCell {

    @IBOutlet var btn: UIButton!
    @IBOutlet var imageUrl: UIImageView!
    @IBOutlet var openBtn: UIButton!
    var model:FTProductCellViewModel!
    var deleage:FTProductTableViewCellDeleage?
    
    @IBOutlet var moreView: UIStackView!
    @IBOutlet var moreBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        btn.layer.borderWidth = 1
        btn.layer.borderColor = FTStyleConfiguration.black.cgColor

        // Initialization code
    }
    @IBAction func moreAction(_ sender: Any) {
        deleage?.moreAction()
    }
    func loadModel(model:FTProductCellViewModel) {
        self.model = model
        imageUrl.image = UIImage.init(named: model.imageUrl)
        if !model.isOpen {
            moreBtn.isHidden = true
            moreView.isHidden = true
        }
    }
    @IBAction func openAction(_ sender: Any) {
        if model.isOpen {
            openBtn.setImage(#imageLiteral(resourceName: "btn_unfold"), for: .normal)
            moreBtn.isHidden = true
            moreView.isHidden = true
            model.isOpen = false
        }else{
            openBtn.setImage(#imageLiteral(resourceName: "btn_unfold-1"), for: .normal)
            moreBtn.isHidden = false
            moreView.isHidden = false
            model.isOpen = true

        }
        deleage?.reload()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
