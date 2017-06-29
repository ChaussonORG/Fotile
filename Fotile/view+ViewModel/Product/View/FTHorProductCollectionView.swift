//
//  FTHorProductCollectionView.swift
//  Fotile
//
//  Created by 郭金涛 on 2017/6/28.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit

class FTHorProductCollectionView: UICollectionView {
    var viewModel = FTProductViewModel()
    var didRow:((FTProductCellViewModel)->Void)?
    let height = UIScreen.width > UIScreen.height ? UIScreen.width : UIScreen.height
    let width = UIScreen.width < UIScreen.height ? UIScreen.width : UIScreen.height
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        loadUI()
    }
    func setViewModel(viewModel:FTProductViewModel) {
        self.viewModel = viewModel
        self.reloadData()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func loadUI(){
        backgroundColor = UIColor.white
        delegate = self
        dataSource = self
        self.register(UINib.init(nibName: "FTHorProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cellid")
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
extension FTHorProductCollectionView:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:FTHorProductCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath) as! FTHorProductCollectionViewCell
        cell.loadModel(model: viewModel.cellViewModels[indexPath.row])
        cell.didSele = {cellViewModel in
            self.didRow!(cellViewModel)
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.cellViewModels.count
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if viewModel.cellViewModels[indexPath.row].isEmpty{
            return
        }
//        var row = indexPath.row - 1
//        if indexPath.row % 2 == 0{
//            row = indexPath.row + 1
//        }
//        let indexp = IndexPath(row: row, section: indexPath.section)
        let cell:FTHorProductCollectionViewCell = collectionView.cellForItem(at: indexPath) as! FTHorProductCollectionViewCell
        cell.setParams(cellViewModel: viewModel.cellViewModels[indexPath.row])
        cell.contentView.bringSubview(toFront: cell.detailView)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return  CGSize(width: (self.height - 325) / 2, height:(self.height - 325) / 2 + 50)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 75, 0, 100)
    }
}
