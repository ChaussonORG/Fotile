//
//  FTHorProductCollectionViewCell.swift
//  Fotile
//
//  Created by 郭金涛 on 2017/6/28.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit


class FTHorProductCollectionViewCell: UICollectionViewCell {
    let height = UIScreen.width > UIScreen.height ? UIScreen.width : UIScreen.height
    var didSele:((FTProductCellViewModel)->Void)?
    @IBOutlet var headImage: UIImageView!
    @IBOutlet var headTitle: UILabel!
    @IBOutlet var detailView: UIView!
    @IBOutlet var imageBackView: UIView!
    @IBOutlet var imageV: UIImageView!
    @IBOutlet var name: UILabel!
    
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var openBtn: UIButton!
    @IBOutlet var content: UILabel!
    @IBOutlet var imageVHeight: NSLayoutConstraint!
    var model:FTProductCellViewModel!
    let vm = FTSliderViewModel()
    let vc = FTProductViewModel()
    func loadModel(model:FTProductCellViewModel) {
        if model.isEmpty {
            
            return
        }
        self.model = model
        imageV.image = model.imageUrl
        imageV.contentMode = .scaleAspectFit
        imageV.backgroundColor = model.color
        headTitle.text = vm.array[Int(model.type) - 1]
        headImage.image = UIImage(named: vc.imagelist[Int(model.type) - 1])
        if !model.isOpen {
            openBtn.setImage(#imageLiteral(resourceName: "btn_unfold"), for: .normal)
        }else{
            openBtn.setImage(#imageLiteral(resourceName: "btn_unfold-1"), for: .normal)
        }
        name.text = model.name + "·" + model.modelNumber
        content.text = model.slogan

    }
    @IBAction func backToView(_ sender: Any) {
        self.contentView.bringSubview(toFront: imageBackView)
    }
    @IBAction func moreAction(_ sender: Any) {
        self.didSele!(self.cellViewModel)
    }
    
    var params:Array<FTProductParm> = Array<FTProductParm> ()
    var cellViewModel = FTProductCellViewModel()
    func setParams(cellViewModel:FTProductCellViewModel){
        self.params = cellViewModel.params
        self.cellViewModel = cellViewModel
        tableView.reloadData()
    }
    @IBOutlet var moreBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        imageV.contentMode = .scaleAspectFit
        imageVHeight.constant = (self.height - 325) / 2 / 1.34
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib.init(nibName: "FTHorCellTableViewCell", bundle: nil), forCellReuseIdentifier: "cellid")
        moreBtn.layer.borderWidth = 1
        moreBtn.layer.borderColor = FTStyleConfiguration.black.cgColor
        // Initialization code
    }
    

}
extension FTHorProductCollectionViewCell:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:FTHorCellTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath) as! FTHorCellTableViewCell
        cell.loadModel(model: params[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return params.count
    }
}
