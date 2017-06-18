//
//  FTProductTableView.swift
//  Fotile
//
//  Created by 郭金涛 on 2017/5/10.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit

protocol FTProductTableViewDeleage {
    func moreAction()
}
class FTProductTableView: UITableView {
    var viewModel = FTProductViewModel()
    var dele:FTProductTableViewDeleage?
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        loadUI()
    }
    func setViewModel(viewModel:FTProductViewModel) {
        self.viewModel = viewModel
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
extension FTProductTableView:UITableViewDelegate,UITableViewDataSource, FTProductTableViewCellDeleage{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:FTProductTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! FTProductTableViewCell
        cell.loadModel(model: viewModel.cellViewModels[indexPath.row])
        cell.deleage = self
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cellViewModels.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if  viewModel.cellViewModels[indexPath.row].isOpen {
            return 380
        }
        return 210
    }
    func reload() {
        self.reloadData()
    }
    func moreAction() {
        dele?.moreAction()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellViewModel:FTProductCellViewModel = viewModel.cellViewModels[indexPath.row]
        cellViewModel.isOpen = !cellViewModel.isOpen
        tableView.reloadData()
    }
}
