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
    let height = UIScreen.width > UIScreen.height ? UIScreen.width : UIScreen.height
    let width = UIScreen.width < UIScreen.height ? UIScreen.width : UIScreen.height
    var array:Array<UIImage> = Array<UIImage>()
    var productModels:Array<FTProduct> = Array<FTProduct>()
    let viewModel:FTProductViewModel = FTProductViewModel()
    let viewModel1:FTProductViewModel = FTProductViewModel()

    var isVer:Bool = true
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        loadUI()
        layout()
        preferredContentSize = UIScreen.main.bounds.size
        // Do any additional setup after loading the view.
    }

    func loadUI() {
        for product in productModels {
            viewModel.cellViewModels.append(viewModel.getCellVieModel(product: product))
            viewModel1.cellViewModels.append(viewModel.getCellVieModel(product: product))
            
        }
        if viewModel1.cellViewModels.count % 2 != 0{
            let model:FTProductCellViewModel = FTProductCellViewModel()
            model.isEmpty = true
            viewModel1.cellViewModels.append(model)
        }
        view.addSubview(tableView)
        view.addSubview(dismisBtn)
        view.addSubview(collection)
        tableView.tableHeaderView = tableHead
        tableHead.addSubview(scrollView)

        if !isVer{
            layoutHor()
        }else{
            layoutVer()
        }
     
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        (UIApplication.shared.delegate as! AppDelegate).isAllow = true
        self.navigationController?.isNavigationBarHidden = true
//        if !isVer{
//            let value = UIInterfaceOrientation.portrait.rawValue
//            UIDevice.current.setValue(value, forKey: "orientation")
//        }
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


        tableView.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(0)
            make.bottom.equalTo(0)
        }
        collection.snp.makeConstraints { (make) in
            make.left.equalTo(50)
            make.right.equalTo(0)
            make.top.equalTo(150)
            make.bottom.equalTo(0)
        }

     
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if size.width > size.height {
            layoutHor()
        }else{
            layoutVer()
        }
    }
    func layoutHor(){
        isVer = false
        collection.isHidden = false
        scrollView.isHidden = true
        tableView.isHidden = true
        view.addSubview(tableLine1)
        view.addSubview(tableHeadLabel)
        view.addSubview(tableLine2)
        tableLine1.snp.remakeConstraints { (make) in
            make.left.equalTo(height / 2 - 40)
            make.top.equalTo(50)
            make.height.equalTo(2)
            make.width.equalTo(80)
        }
        tableHeadLabel.snp.remakeConstraints { (make) in
            make.left.right.equalTo(tableLine1)
            make.top.equalTo(tableLine1.snp.bottom).offset(15)
            make.height.equalTo(20)
        }
        tableLine2.snp.remakeConstraints { (make) in
            make.left.equalTo(tableLine1)
            make.top.equalTo(tableHeadLabel.snp.bottom).offset(15)
            make.height.equalTo(2)
            make.width.equalTo(80)
        }
        dismisBtn.setImage(#imageLiteral(resourceName: "btn_showPlan_landscape-1"), for: .normal)
        dismisBtn.snp.remakeConstraints { (make) in
            make.top.equalTo(width / 2 - 25)
            make.left.equalTo(0)
            make.height.equalTo(50)
            make.width.equalTo(25)
        }

    }
    func layoutVer(){
        isVer = true
        collection.isHidden = true
        scrollView.isHidden = false
        tableView.isHidden = false
        tableHead.addSubview(tableLine1)
        tableHead.addSubview(tableHeadLabel)
        tableHead.addSubview(tableLine2)
        tableLine1.snp.remakeConstraints { (make) in
            make.left.equalTo(width / 2 - 40)
            make.top.equalTo(scrollView.snp.bottom).offset(50)
            make.height.equalTo(2)
            make.width.equalTo(80)
        }
        tableHeadLabel.snp.remakeConstraints { (make) in
            make.left.right.equalTo(tableLine1)
            make.top.equalTo(tableLine1.snp.bottom).offset(15)
            make.height.equalTo(20)
        }
        tableLine2.snp.remakeConstraints { (make) in
            make.left.equalTo(tableLine1)
            make.top.equalTo(tableHeadLabel.snp.bottom).offset(15)
            make.height.equalTo(2)
            make.width.equalTo(80)
        }
        dismisBtn.setImage(#imageLiteral(resourceName: "btn_showPlan_portrait-1"), for: .normal)
        dismisBtn.snp.remakeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(width / 2 - 25)
            make.height.equalTo(25)
            make.width.equalTo(50)
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
        table.dele = self
        return table
    }()
    
    lazy var collection:FTHorProductCollectionView = {
        let  layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        let view:FTHorProductCollectionView = FTHorProductCollectionView(frame: .zero, collectionViewLayout: layout)
        view.setViewModel(viewModel: self.viewModel1)
        view.didRow = { cellViewModel in
            let vm = FTProductDetailVM(cellViewModel:cellViewModel)
            let vc = FTProductDetailViewController()
            vc.isVer = self.isVer
            vc.viewModel = vm
            self.navigationController?.pushViewController(vc, animated: true)
        }
        return view
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
extension FTSchemeViewController:FTProductTableViewDeleage{
    func getSection(section: Int) {
        
    }

    func moreAction(viewModel:FTProductCellViewModel) {
        let vm = FTProductDetailVM(cellViewModel:viewModel)
        let vc = FTProductDetailViewController()
        vc.viewModel = vm
        navigationController?.pushViewController(vc, animated: true)
    }
}
