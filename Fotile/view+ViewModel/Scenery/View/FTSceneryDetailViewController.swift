//
//  FTSceneryDetailViewController.swift
//  Fotile
//
//  Created by 郭金涛 on 2017/5/15.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit
import HYBLoopScrollView
class FTSceneryDetailViewController: UIViewController {

    var inforArray = Array<String>()
    var inforArray1 = Array<String>()

    var model:FTRealKitchen = FTRealKitchen()
    let viewModel:FTProductViewModel = FTProductViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = .bottom
        view.backgroundColor = UIColor.white
        viewModel.getSceneryData(id: model.identifier)
        againLoadui()
        loadUI()
        layout()
        banner()
        // Do any additional setup after loading the view.
    }
    func banner() {
        var arr = Array<UIImage>()
        for fimage in model.images{
            arr.append(fimage.picture)
        }
        scrollView.imageUrls = arr
    }
    func againLoadui() {
        if model.estateName.length != 0 {
            inforArray.append(model.estateName)
            inforArray1.append("小区名称")
        }
        if model.houseArea.length != 0 {
            inforArray.append(model.houseArea)
            inforArray1.append("房屋面积(m²)")
        }
        if model.kitchenArea.length != 0 {
            inforArray.append(model.kitchenArea)
            inforArray1.append("厨房面积(m²)")
        }
        
        if model.kitchenCost.length != 0 {
            inforArray.append(model.kitchenCost)
            inforArray1.append("装修成本(万)")
        }
 
        if model.fotileCost.length != 0 {
            inforArray.append(model.fotileCost  )
            inforArray1.append("厨电成本(万)")
        }
    }
    func loadUI() {
        view.addSubview(tableView)
        view.addSubview(dismisBtn)
        tableView.tableHeaderView = tableHead
        tableHead.addSubview(scrollView)
        tableHead.addSubview(tableLine1)
        tableHead.addSubview(tableLine2)
        tableHead.addSubview(tableHeadLabel)
        tableHead.addSubview(collectionView)
    }
    lazy var tableHead:UIView = {
        let view:UIView = UIView(frame: CGRect.init(x: 0, y: 0, width: 0, height: 676 + 80))
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
        label.text = "厨电列表"
        label.font = FTStyleConfiguration.font13
        label.textAlignment = .center
        return label
    }()
    lazy var informationView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        return view
    }()
    lazy var collectionView:UICollectionView = {
        let  layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 170, height: 80)
        let collectionView:UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.collectionViewLayout = layout
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isScrollEnabled = false
        collectionView.register(FTSceneryDetailCollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
        return collectionView
    }()
    
    func layout() {
        scrollView.snp.makeConstraints { (make) in
            make.right.left.top.equalTo(0)
            make.height.equalTo(526)
        }
        
        dismisBtn.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.top.equalTo(0)
            make.height.equalTo(85)
            make.width.equalTo(60)
        }
        tableView.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(0)
            make.bottom.equalTo(0)
        }
        collectionView.snp.makeConstraints { (make) in
            make.left.equalTo((view.frame.size.width - CGFloat(170 * inforArray.count)) / 2)
            make.height.equalTo(80)
            make.top.equalTo(scrollView.snp.bottom).offset(0)
            make.right.equalTo(-(view.frame.size.width - CGFloat(170 * inforArray.count)) / 2)
        }
        
        tableLine1.snp.makeConstraints { (make) in
            make.left.equalTo(view.frame.size.width / 2 - 40)
            make.top.equalTo(collectionView.snp.bottom).offset(50)
            make.height.equalTo(2)
            make.width.equalTo(80)
        }
        tableHeadLabel.snp.makeConstraints { (make) in
            make.left.right.equalTo(tableLine2)
            make.top.equalTo(tableLine1.snp.bottom).offset(15)
            make.height.equalTo(20)
        }
        tableLine2.snp.makeConstraints { (make) in
            make.left.equalTo(view.frame.size.width / 2 - 40)
            make.bottom.equalTo(-50)
            make.height.equalTo(2)
            make.width.equalTo(80)
        }
    
    }
    lazy var scrollView:HYBLoopScrollView = {
        let scorllView:HYBLoopScrollView = HYBLoopScrollView(frame: CGRect.zero, imageUrls: nil, timeInterval: 2, didSelect: {[weak self] (didIndex) in
            
            }, didScroll: nil)
        return scorllView
    }()
    lazy var tableView:FTProductTableView = {
        let table:FTProductTableView = FTProductTableView(frame: .zero, style: .plain)
        table.dele = self
        table.setViewModel(viewModel: self.viewModel)
        return table
    }()
    lazy var dismisBtn:UIButton = {
        let btn:UIButton = UIButton(type:.custom)
        btn.setImage(#imageLiteral(resourceName: "btn_back"), for: .normal)
        btn.addTarget(self, action: #selector(dismisAction), for:.touchUpInside)
        return btn
    }()
    func dismisAction(){
        navigationController?.popViewController(animated: true)
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
extension FTSceneryDetailViewController:UICollectionViewDelegate, UICollectionViewDataSource,FTProductTableViewDeleage{
    func getSection(section: Int) {
        
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:FTSceneryDetailCollectionViewCell =  collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! FTSceneryDetailCollectionViewCell
        if indexPath.row == inforArray1.count - 1 {
            cell.titleLabel2.isHidden = true
        }
        cell.loadString(str: inforArray[indexPath.row], str1: inforArray1[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return inforArray.count
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
    }
    func moreAction(viewModel:FTProductCellViewModel) {
        let vm = FTProductDetailVM(cellViewModel:viewModel)
        let vc = FTProductDetailViewController()
        vc.viewModel = vm
        navigationController?.pushViewController(vc, animated: true)
    }
}
