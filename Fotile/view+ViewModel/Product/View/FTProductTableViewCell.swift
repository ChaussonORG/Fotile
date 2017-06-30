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
    func moreAction(viewModel:FTProductCellViewModel)
}
class FTProductTableViewCell: UITableViewCell {

    @IBOutlet var btn: UIButton!
    @IBOutlet var imageUrl: UIImageView!
    @IBOutlet var openBtn: UIButton!
    @IBOutlet var name: UILabel!
    @IBOutlet var typeNumber: UILabel!
    @IBOutlet var conten: UILabel!
    
    @IBOutlet var type1: UILabel!
    @IBOutlet var typeName1: UILabel!
    @IBOutlet var type2: UILabel!
    @IBOutlet var typeName2: UILabel!
    @IBOutlet var type3: UILabel!
    @IBOutlet var typeName3: UILabel!
    @IBOutlet var type4: UILabel!
    @IBOutlet var typeName4: UILabel!
    @IBOutlet var type5: UILabel!
    @IBOutlet var typeName5: UILabel!
    @IBOutlet var type6: UILabel!
    @IBOutlet var typeName6: UILabel!
    
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
        deleage?.moreAction(viewModel: self.model)
    }
    func loadModel(model:FTProductCellViewModel) {
        self.model = model
        imageUrl.image = model.imageUrl
        if !model.isOpen {
            openBtn.setImage(#imageLiteral(resourceName: "btn_unfold"), for: .normal)
            moreBtn.isHidden = true
            moreView.isHidden = true
        }else{
            openBtn.setImage(#imageLiteral(resourceName: "btn_unfold-1"), for: .normal)
            moreBtn.isHidden = false
            moreView.isHidden = false            
        }
        imageUrl.backgroundColor = model.color

        name.text = model.name
        typeNumber.text = model.modelNumber
        conten.text = model.slogan
        for i in 0..<model.params.count {
            let item = model.params[i]
            if i == 0 {
                type1.text = item.title
                typeName1.text = item.content
            }
            if i == 1 {
                type2.text = item.title
                typeName2.text = item.content
            }
            if i == 2 {
                type3.text = item.title
                typeName3.text = item.content
            }
            if i == 3 {
                type4.text = item.title
                typeName4.text = item.content
            }
            if i == 4 {
                type5.text = item.title
                typeName5.text = item.content
            }
            if i == 5 {
                type6.text = item.title
                typeName6.text = item.content
            }
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
