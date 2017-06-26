//
//  FTSchemeViewController.swift
//  Fotile
//
//  Created by 郭金涛 on 2017/5/10.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit
import HYBLoopScrollView
class FTSchemeViewController: UIViewController {

    var array:Array<UIImage> = Array<UIImage>()
    var productModels:Array<FTProduct> = Array<FTProduct>()
    let viewModel:FTProductViewModel = FTProductViewModel()
    var isVer:Bool = true
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        loadUI()
        layout()
        // Do any additional setup after loading the view.
    }

    func loadUI() {
        for product in productModels {
            viewModel.cellViewModels.append(viewModel.getCellVieModel(product: product))
        }
        view.addSubview(tableView)
        view.addSubview(dismisBtn)
        tableView.tableHeaderView = tableHead
        tableHead.addSubview(scrollView)
        tableHead.addSubview(tableLine1)
        tableHead.addSubview(tableLine2)
        tableHead.addSubview(tableHeadLabel)
     
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if !isVer{
            let value = UIInterfaceOrientation.portrait.rawValue
            UIDevice.current.setValue(value, forKey: "orientation")
        }

    }
    lazy var tableHead:UIView = {
        let view:UIView = UIView(frame: CGRect.init(x: 0, y: 0, width: 0, height: 676))
        return view
    }()
    lazy var tableLine1:UIView = {
        let view:UIView = UIView()
        view.backgroundColor = UIColor.black
        return view
    }()
    lazy var tableLine2:UIView = {
        let view:UIView = UIView()
        view.backgroundColor = UIColor.black
        return view
    }()
    lazy var tableHeadLabel:UILabel = {
        let label:UILabel = UILabel()
        label.textColor = FTStyleConfiguration.black
        label.text = "您的已选方案"
        label.font = FTStyleConfiguration.font13
        label.textAlignment = .center
        return label
    }()
    override var prefersStatusBarHidden: Bool{
        return true
    }
 
    func layout() {
        scrollView.snp.makeConstraints { (make) in
            make.right.left.top.equalTo(0)
            make.height.equalTo(526)
        }

        dismisBtn.snp.makeConstraints { (make) in
            if !isVer{
                make.centerX.equalTo(view.center.y)
            }else{
                make.centerX.equalTo(view.center.x)
            }
            make.top.equalTo(0)
            make.height.equalTo(25)
            make.width.equalTo(50)
        }
        tableView.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(0)
            make.bottom.equalTo(0)
        }
        tableLine1.snp.makeConstraints { (make) in
            if !isVer{
                make.left.equalTo(view.frame.size.height / 2 - 40)
            }else{
                make.left.equalTo(view.frame.size.width / 2 - 40)
            }
            make.top.equalTo(scrollView.snp.bottom).offset(50)
            make.height.equalTo(2)
            make.width.equalTo(80)
        }
        tableHeadLabel.snp.makeConstraints { (make) in
            make.left.right.equalTo(tableLine2)
            make.top.equalTo(tableLine1.snp.bottom).offset(15)
            make.height.equalTo(20)
        }
        tableLine2.snp.makeConstraints { (make) in
            if !isVer{
                make.left.equalTo(view.frame.size.height / 2 - 40)
            }else{
                make.left.equalTo(view.frame.size.width / 2 - 40)
            }
            make.bottom.equalTo(-50)
            make.height.equalTo(2)
            make.width.equalTo(80)
        }
     
    }
    lazy var scrollView:HYBLoopScrollView = {
        let scorllView:HYBLoopScrollView = HYBLoopScrollView(frame: CGRect.zero, imageUrls: self.array, timeInterval: 2, didSelect: {[weak self] (didIndex) in
            
            }, didScroll: nil)
        return scorllView
    }()
    lazy var tableView:FTProductTableView = {
        let table:FTProductTableView = FTProductTableView(frame: .zero, style: .plain)
        table.setViewModel(viewModel: self.viewModel)
        return table
    }()
    lazy var dismisBtn:UIButton = {
        let btn:UIButton = UIButton(type:.custom)
        btn.setImage(#imageLiteral(resourceName: "btn_showPlan_portrait-1"), for: .normal)
        btn.addTarget(self, action: #selector(dismisAction), for:.touchUpInside)
        return btn
    }()
    func dismisAction(){
        self.dismiss(animated: true) { 
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
