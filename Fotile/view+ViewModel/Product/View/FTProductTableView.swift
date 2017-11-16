//
//  FTProductTableView.swift
//  Fotile
//
//  Created by 郭金涛 on 2017/5/10.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit

protocol FTProductTableViewDeleage:NSObjectProtocol {
    func moreAction(viewModel:FTProductCellViewModel)
    func getSection(section:Int)
}
class FTProductTableView: UITableView {
    var viewModel = FTProductViewModel()
    weak var dele:FTProductTableViewDeleage?
    var isProduct:Bool = false
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        loadUI()
    }
    func setViewModel(viewModel:FTProductViewModel) {
        self.viewModel = viewModel
        self.reload()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func loadUI() {
        delegate = self
        dataSource = self
        
        separatorStyle = .none
        register(UINib.init(nibName: "FTProductTableViewCell", bundle: nil), forCellReuseIdentifier: "cellId")
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
extension FTProductTableView:UITableViewDelegate,UITableViewDataSource, FTProductTableViewCellDeleage,UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let cell = self.visibleCells.first else{
            return
        }
        let indexpath = self.indexPath(for: cell)
        if indexpath?.section != nil {
            self.dele?.getSection(section: (indexpath?.section)!)

        }
    }
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        guard let cell = self.visibleCells.first else{
//            return
//        }
//        let indexpath = self.indexPath(for: cell)
//        self.dele?.getSection(section: (indexpath?.section)!)
//    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:FTProductTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! FTProductTableViewCell
        if isProduct {
            cell.loadModel(model: viewModel.products[indexPath.section].products[indexPath.row])
        }else{
            cell.loadModel(model: viewModel.cellViewModels[indexPath.row])
        }
        cell.deleage = self
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        if isProduct{
            return viewModel.products.count
        }
        return 1
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if isProduct {
            return viewModel.products[section].typeName
        }
        return ""
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if isProduct{
            let view:UIView = UIView(frame: CGRect.init(x: 0, y: 0, width: 0, height: 80))
            view.backgroundColor = UIColor.white
            let imageV:UIImageView = UIImageView(frame: CGRect.init(x: 25, y: 25, width: 25, height: 25))
            imageV.image = UIImage(named: viewModel.imagelist[section])
            view.addSubview(imageV)
            
            let label = UILabel(frame: CGRect.init(x: 57, y: 27, width: 300, height: 22))
            label.textColor = FTStyleConfiguration.black
            label.text = viewModel.products[section].typeName
            view.addSubview(label)
            return view
        }
        return nil

    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if isProduct{
            return 75
        }
        return 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isProduct {
            return viewModel.products[section].products.count
        }
        return viewModel.cellViewModels.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if isProduct {
            if  viewModel.products[indexPath.section].products[indexPath.row].isOpen {
                return 380
            }
            return 210
        }
        if  viewModel.cellViewModels[indexPath.row].isOpen {
            return 380
        }
        return 210
    }
    func reload() {
        self.reloadData()
    }
    func moreAction(viewModel:FTProductCellViewModel) {
        
        dele?.moreAction(viewModel: viewModel)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isProduct {
            let cellViewModel:FTProductCellViewModel = viewModel.products[indexPath.section].products[indexPath.row]
            cellViewModel.isOpen = !cellViewModel.isOpen
        }else{
            let cellViewModel:FTProductCellViewModel = viewModel.cellViewModels[indexPath.row]
            cellViewModel.isOpen = !cellViewModel.isOpen
        }
        tableView.reloadData()
    }
}
