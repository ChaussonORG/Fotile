//
//  FTYearsOptionsTableView.swift
//  Fotile
//
//  Created by 郭金涛 on 2017/6/3.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit

class FTYearsOptionsTableView: UITableView {
    let viewModel:FTSliderViewModel = FTSliderViewModel()
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        loadUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func loadUI() {
        delegate = self
        dataSource = self
        separatorStyle = .none
        self.register(UINib.init(nibName: "FTYearsTableViewCell", bundle: nil), forCellReuseIdentifier: "cellid")
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
extension FTYearsOptionsTableView:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:FTYearsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath) as! FTYearsTableViewCell
        cell.loadModel(model: viewModel.yearsModels[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.yearsModels.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        for i in 0..<viewModel.yearsModels.count {
            let model:FTSliderCellViewModel = viewModel.yearsModels[i]
            if i == indexPath.row {
                model.isSele = true
            }else{
                model.isSele = false
            }
        }
        tableView.reloadData()
        print(viewModel.yearsModels[indexPath.row].isSele)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
