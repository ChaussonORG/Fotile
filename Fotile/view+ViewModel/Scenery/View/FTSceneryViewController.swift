//
//  FTSceneryViewController.swift
//  Fotile
//
//  Created by 郭金涛 on 2017/4/25.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit

class FTSceneryViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        view.addSubview(collectionView)
        view.addSubview(headView)
        headView.addSubview(lineView)
        headView.addSubview(searchImage)
        headView.addSubview(searchText)
        headView.addSubview(typeBtn)
        headView.addSubview(areaBtn)
        headView.addSubview(costBtn)
        UIApplication.shared.keyWindow?.addSubview(screenBackView)
        UIApplication.shared.keyWindow?.addSubview(screenTable)
        UIApplication.shared.keyWindow?.addSubview(areaScreen)
        UIApplication.shared.keyWindow?.addSubview(costScreen)

        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(70)
            make.left.right.equalTo(0)
            make.bottom.equalTo(-49)
        }
        headView.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.left.right.equalTo(0)
            make.bottom.equalTo(collectionView.snp.top)
        }
        lineView.snp.makeConstraints { (make) in
            make.bottom.equalTo(0)
            make.left.right.equalTo(0)
            make.height.equalTo(1)
        }
        searchImage.snp.makeConstraints { (make) in
            make.top.equalTo(29)
            make.width.height.equalTo(22)
            make.left.equalTo(25)
        }
        searchText.snp.makeConstraints { (make) in
            make.top.equalTo(25)
            make.height.equalTo(30)
            make.width.equalTo(200)
            make.left.equalTo(searchImage.snp.right).offset(10)
        }
        costBtn.snp.makeConstraints { (make) in
            make.top.equalTo(25)
            make.height.equalTo(30)
            make.width.equalTo(120)
            make.right.equalTo(-50)
        }
        areaBtn.snp.makeConstraints { (make) in
            make.top.equalTo(25)
            make.height.equalTo(30)
            make.width.equalTo(120)
            make.right.equalTo(costBtn.snp.left).offset(-30)
        }
        typeBtn.snp.makeConstraints { (make) in
            make.top.equalTo(25)
            make.height.equalTo(30)
            make.width.equalTo(120)
            make.right.equalTo(areaBtn.snp.left).offset(-30)
        }

    }
    let screenViewModel:FTScreeningViewModel = FTScreeningViewModel()
    lazy var screenTable:FTScreeningTableView = {
        let view:FTScreeningTableView = FTScreeningTableView(frame: CGRect.init(x: 0, y: 70, width: self.view.frame.size.width, height: 0), style: .plain)
        return view
    }()
    lazy var areaScreen:FTScreeningCostAndAreaView = {
        let view:FTScreeningCostAndAreaView = FTScreeningCostAndAreaView(frame:  CGRect.init(x: 0, y: 70, width: self.view.frame.size.width, height: 0))
        view.loadUI(cellViewModels: self.screenViewModel.areaCellViewModels)
        return view
    }()
    lazy var costScreen:FTScreeningCostAndAreaView = {
        let view:FTScreeningCostAndAreaView = FTScreeningCostAndAreaView(frame:  CGRect.init(x: 0, y: 70, width: self.view.frame.size.width, height: 0))
        view.loadUI(cellViewModels: self.screenViewModel.costCellViewModels)
        return view
    }()
    lazy var screenBackView:UIView = {
        let view:UIView = UIView(frame: CGRect.init(x: 0, y: 70, width: self.view.frame.size.width, height:self.view.frame.size.height - 70))
        view.isHidden = true
        view.backgroundColor = UIColor.black
        view.alpha = 0.6
        return view
    }()
    lazy var headView:UIView = {
        let view = UIView()
        return view
    }()
    lazy var lineView:UIView = {
        let view = UIView()
        view.backgroundColor = FTStyleConfiguration.line
        return view
    }()
    lazy var searchImage:UIImageView = {
        let imageV:UIImageView = UIImageView()
        imageV.image = #imageLiteral(resourceName: "icon_search")
        return imageV
    }()
    lazy var searchText:UITextField = {
        let text:UITextField = UITextField()
        text.returnKeyType = .search
        text.font = FTStyleConfiguration.font14
        text.placeholder = "搜索"
        return text
    }()
    lazy var typeBtn:UIButton = {
        let btn:UIButton = UIButton(type: .custom)
        btn.setTitle("产品型号", for: .normal)
        btn.setImage(#imageLiteral(resourceName: "btn_unfold-1"), for: .normal)
        btn.setImage(#imageLiteral(resourceName: "btn_unfold"), for: .selected)
        btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 100, bottom: 0, right: 0)
        btn.setTitleColor(FTStyleConfiguration.b3b3b3, for: .normal)
        btn.setTitleColor(FTStyleConfiguration.red, for: .selected)
        btn.titleLabel?.font = FTStyleConfiguration.font14
        btn.addTarget(self, action: #selector(typeAction), for: .touchUpInside)
        return btn
    }()
    lazy var areaBtn:UIButton = {
        let btn:UIButton = UIButton(type: .custom)
        btn.setTitle("厨房面积", for: .normal)
        btn.setImage(#imageLiteral(resourceName: "btn_unfold-1"), for: .normal)
        btn.setImage(#imageLiteral(resourceName: "btn_unfold"), for: .selected)
        btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 100, bottom: 0, right: 0)
        btn.setTitleColor(FTStyleConfiguration.b3b3b3, for: .normal)
        btn.setTitleColor(FTStyleConfiguration.red, for: .selected)
        btn.titleLabel?.font = FTStyleConfiguration.font14
        btn.addTarget(self, action: #selector(areaAction), for: .touchUpInside)
        return btn
    }()
    lazy var costBtn:UIButton = {
        let btn:UIButton = UIButton(type: .custom)
        btn.setTitle("厨电成本", for: .normal)
        btn.setImage(#imageLiteral(resourceName: "btn_unfold-1"), for: .normal)
        btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 100, bottom: 0, right: 0)
        btn.setImage(#imageLiteral(resourceName: "btn_unfold"), for: .selected)
        btn.setTitleColor(FTStyleConfiguration.b3b3b3, for: .normal)
        btn.setTitleColor(FTStyleConfiguration.red, for: .selected)
        btn.titleLabel?.font = FTStyleConfiguration.font14
        btn.addTarget(self, action: #selector(costAction), for: .touchUpInside)
        return btn
    }()
    func typeAction() {
        typeBtn.isSelected = !typeBtn.isSelected
        areaBtn.isSelected = false
        costBtn.isSelected = false
        hideArea()
        hideCost()
        if typeBtn.isSelected {
            showType()
        }else{
            hideType()
        }
    }

    
    func areaAction() {
        areaBtn.isSelected = !areaBtn.isSelected
        typeBtn.isSelected = false
        costBtn.isSelected = false
        hideType()
        hideCost()
        if areaBtn.isSelected {
            showArea()
        }else{
            hideArea()
        }
    }
    func costAction() {
        costBtn.isSelected = !costBtn.isSelected
        areaBtn.isSelected = false
        typeBtn.isSelected = false
        hideType()
        hideArea()
        if costBtn.isSelected {
            showCost()
        }else{
            hideCost()
        }
    }
    
    func showType() {
        screenBackView.isHidden = false
        UIView.animate(withDuration: 0.5) {
            self.screenTable.frame = CGRect.init(x: 0, y: 70, width: self.view.frame.size.width, height: self.view.frame.size.height - 270)
        }
    }
    func hideType() {
        screenBackView.isHidden = true
        UIView.animate(withDuration: 0) {
            self.screenTable.frame = CGRect.init(x: 0, y: 70, width: self.view.frame.size.width, height: 0)
        }
    }
    func showArea() {
        screenBackView.isHidden = false
        UIView.animate(withDuration: 0.5) {
            self.areaScreen.frame = CGRect.init(x: 0, y: 70, width: self.view.frame.size.width, height: 120)
        }
    }
    func hideArea() {
        screenBackView.isHidden = true
        UIView.animate(withDuration: 0) {
            self.areaScreen.frame = CGRect.init(x: 0, y: 70, width: self.view.frame.size.width, height: 0)
        }
    }
    func showCost() {
        screenBackView.isHidden = false
        UIView.animate(withDuration: 0.5) {
            self.costScreen.frame = CGRect.init(x: 0, y: 70, width: self.view.frame.size.width, height: 120)
        }
    }
    func hideCost() {
        screenBackView.isHidden = true
        UIView.animate(withDuration: 0) {
            self.costScreen.frame = CGRect.init(x: 0, y: 70, width: self.view.frame.size.width, height: 0)
        }
    }
    lazy var collectionView:UICollectionView = {
        let  layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        //layout.sectionInset = UIEdgeInsetsMake(0, 25, 0, 25)
        layout.itemSize = CGSize(width: UIScreen.main.bounds.size.width / 2, height: UIScreen.main.bounds.size.width / 2 / 1.33 + 65)
        layout.headerReferenceSize = CGSize(width: self.view.frame.size.width, height: 50)
        let collectionView:UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.collectionViewLayout = layout
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(FTSceneryCollectionCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.register(HeaderReusableView.classForCoder(), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "header")
        return collectionView
    }()
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
        (UIApplication.shared.delegate as! AppDelegate).ftView?.isHidden = false
        collectionView.reloadData()
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
class HeaderReusableView: UICollectionReusableView {
    var headerLb:UILabel!
    var headerLb1:UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        headerLb=UILabel()
        headerLb.font = FTStyleConfiguration.font22
        headerLb.textColor=FTStyleConfiguration.d4d4d4
        self .addSubview(headerLb!)
        headerLb.snp.makeConstraints { (make) in
            make.left.equalTo(25)
            make.top.equalTo(17)
            make.height.equalTo(25)
        }
        headerLb1=UILabel()
        headerLb1.font = FTStyleConfiguration.font18
        headerLb1.textColor=FTStyleConfiguration.b3b3b3
        self .addSubview(headerLb1!)
        headerLb1.snp.makeConstraints { (make) in
            make.top.equalTo(17)
            make.left.equalTo(headerLb.snp.right).offset(15)
            make.height.equalTo(25)
        }
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension FTSceneryViewController:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:FTSceneryCollectionCell =  collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! FTSceneryCollectionCell
        let array:[FTRealKitchen] = FTRealKitchenService.fetchRealKitchens(withCity: FTUserManager.userManager.getModel().userInfo.city)[indexPath.section].list as! [FTRealKitchen]
        cell.loadModel(model: array[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let array:[FTRealKitchen] = FTRealKitchenService.fetchRealKitchens(withCity: FTUserManager.userManager.getModel().userInfo.city)[section].list as! [FTRealKitchen]
        return array.count
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let array:[FTRealKitchen] = FTRealKitchenService.fetchRealKitchens(withCity: FTUserManager.userManager.getModel().userInfo.city)[indexPath.section].list as! [FTRealKitchen]
       let vc = FTSceneryDetailViewController()
        vc.model = array[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return FTRealKitchenService.fetchRealKitchens(withCity: FTUserManager.userManager.getModel().userInfo.city).count
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let model:FTRealKitchenList = FTRealKitchenService.fetchRealKitchens(withCity: FTUserManager.userManager.getModel().userInfo.city)[indexPath.section]
        switch kind{
        case UICollectionElementKindSectionHeader:
            let header:HeaderReusableView=collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! HeaderReusableView
            header.headerLb!.text = model.name + "   ·"
            header.headerLb1.text = model.city
            return header
        default:
            return HeaderReusableView()
        }
    }

    
}
