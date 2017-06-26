
//
//  FTScreeningTableView.swift
//  Fotile
//
//  Created by 郭金涛 on 2017/5/23.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit

protocol FTScreeningTableViewDeleage {
    func didSeletecedAction(title:String)
}
class FTScreeningTableView: UITableView {
    let viewModel:FTScreeningViewModel = FTScreeningViewModel()
    var dele:FTScreeningTableViewDeleage?
    var titleString:String = ""
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        loadUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func loadUI(){
        delegate = self
        dataSource = self
        separatorStyle = .none
        register(FTScreeningTableViewCell.classForCoder(), forCellReuseIdentifier: "cellid")
    }
    func typeAction(sender:UIButton){
        let model = viewModel.cellViewModels[sender.tag]
        if model.items.count <= 5 {
            return
        }
        model.isOpen = !model.isOpen
        if model.isOpen {
            model.height = FTScreeningViewModel.getHeight(number: model.items.count)
            reloadData()
        }else{
            model.height = 30
            reloadData()
        }
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
extension FTScreeningTableView:UITableViewDelegate, UITableViewDataSource, FTScreeningTableViewCellDeleage{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:FTScreeningTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath) as! FTScreeningTableViewCell
        cell.deleage = self
        cell.loadUI(model:viewModel.cellViewModels[indexPath.section], section: indexPath.section)
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.cellViewModels.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.cellViewModels[indexPath.section].height
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let model = viewModel.cellViewModels[section]
        let view:UIView = UIView(frame: CGRect.init(x: 0, y: 0, width: 0, height: 100))
        let btn:UIButton = UIButton(type: .custom)
        btn.setTitle(model.title, for: .normal)
        btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: CGFloat(25 * model.title.length), bottom: 0, right: 0)
        btn.contentHorizontalAlignment = .left
        btn.isSelected = viewModel.cellViewModels[section].isOpen
        btn.setTitleColor(FTStyleConfiguration.b3b3b3, for: .normal)
        btn.titleLabel?.font = FTStyleConfiguration.font14
        btn.addTarget(self, action: #selector(typeAction), for: .touchUpInside)
        btn.tag = section
        view.addSubview(btn)
        btn.snp.makeConstraints { (make) in
            make.left.equalTo(45)
            make.right.equalTo(-50)
            make.top.equalTo(50)
            make.height.equalTo(30)
        }
        if model.items.count > 5 {
            btn.setImage(#imageLiteral(resourceName: "btn_unfold-1"), for: .normal)
            btn.setImage(#imageLiteral(resourceName: "btn_unfold"), for: .selected)
        }else{
            btn.snp.updateConstraints { (make) in
                make.left.equalTo(55)
            }
        }
        
        return view
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    func didSeletecedAction(row: Int, section: Int) {
        for i in 0..<viewModel.cellViewModels.count {
            let model = viewModel.cellViewModels[i]
            for j in  0..<model.items.count{
                let item = model.items[j]
                if i == section && j == row {
                    item.isSelected = !item.isSelected
                    self.titleString = item.title
                }else{
                    item.isSelected = false

                }
            }
        }
        self.dele?.didSeletecedAction(title: titleString)
        reloadData()
    }
}
