//
//  FTResultWaterController.swift
//  Fotile
//
//  Created by Chausson on 2017/11/13.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit

class FTResultWaterController: UIViewController {
    @IBOutlet weak var titleView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        layout()
        // Do any additional setup after loading the view.
    }

    func layout() {
        tableView.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.top.equalTo(titleView.snp.bottom).offset(0)
            make.right.equalTo(0)
            make.bottom.equalTo(0)
        }
    }
    lazy var tableView:FTProductTableView = {
        let table:FTProductTableView = FTProductTableView(frame: .zero, style: .plain)
        table.dele = self
        table.isProduct = false
        table.sectionHeaderHeight = 0
        table.setViewModel(viewModel: waterHeater.viewModel)
        return table
    }()

}
extension FTResultWaterController:FTProductTableViewDeleage{
    func getSection(section: Int) {
        
    }
    
    func clickBtnActionOption(index: Int) {
    
    }
    
    func moreAction(viewModel:FTProductCellViewModel) {
        var vm = FTProductDetailVM(cellViewModel:viewModel)
        let vc = FTProductDetailViewController()
        vm.isFilter = true
        vc.viewModel = vm
        navigationController?.pushViewController(vc, animated: true)
    }
}
