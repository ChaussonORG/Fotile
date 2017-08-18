//
//  FTSceneryViewController.swift
//  Fotile
//
//  Created by 郭金涛 on 2017/4/25.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit

class FTSceneryViewController: UIViewController {
    var locationModels = Array<FTRealKitchenList>()
    var allModels = Array<FTRealKitchenList>()
    var topModels = FTRealKitchenList()

    var productNum:String = ""
    var area:String = ""
    var cost:String = ""
    var costMax:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        view.addSubview(collectionView1)
        view.addSubview(collectionView)
        view.addSubview(headView)
        headView.addSubview(lineView)
        headView.addSubview(searchImage)
        headView.addSubview(searchText)
        headView.addSubview(localBtn)
        headView.addSubview(countrywideBtn)
        headView.addSubview(topLine)
        view.addSubview(typeBtn)
        view.addSubview(areaBtn)
        view.addSubview(costBtn)
        view.addSubview(lineView1)
        UIApplication.shared.keyWindow?.addSubview(screenBackView)
        UIApplication.shared.keyWindow?.addSubview(screenTable)
        UIApplication.shared.keyWindow?.addSubview(areaScreen)
        UIApplication.shared.keyWindow?.addSubview(costScreen)

        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(108)
            make.left.right.equalTo(0)
            make.bottom.equalTo(-49)
        }
        collectionView1.snp.makeConstraints { (make) in
            make.top.equalTo(108)
            make.left.right.equalTo(0)
            make.bottom.equalTo(-49)
        }
        headView.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.left.right.equalTo(0)
            make.height.equalTo(54)
        }
      
        lineView.snp.makeConstraints { (make) in
            make.bottom.equalTo(0)
            make.left.right.equalTo(0)
            make.height.equalTo(1)
        }
        lineView1.snp.makeConstraints { (make) in
            make.bottom.equalTo(collectionView1.snp.top)
            make.left.right.equalTo(0)
            make.height.equalTo(1)
        }
        searchImage.snp.makeConstraints { (make) in
            make.top.equalTo(27)
            make.width.height.equalTo(16)
            make.left.equalTo(25)
        }
        searchText.snp.makeConstraints { (make) in
            make.top.equalTo(21)
            make.height.equalTo(30)
            make.width.equalTo(200)
            make.left.equalTo(searchImage.snp.right).offset(10)
        }
        
        localBtn.snp.makeConstraints { (make) in
            make.top.equalTo(21)
            make.height.equalTo(30)
            make.width.equalTo(50)
            make.left.equalTo((UIScreen.width - 200) / 2)
        }
        countrywideBtn.snp.makeConstraints { (make) in
            make.top.equalTo(21)
            make.height.equalTo(30)
            make.width.equalTo(50)
            make.right.equalTo(-(UIScreen.width - 200) / 2)
        }
        topLine.snp.makeConstraints { (make) in
            make.bottom.equalTo(0)
            make.left.equalTo(localBtn.snp.left)
            make.width.equalTo(50)
            make.height.equalTo(4)
        }
        
        costBtn.snp.makeConstraints { (make) in
            make.top.equalTo(71)
            make.height.equalTo(30)
            make.width.equalTo(120)
            make.right.equalTo(-(UIScreen.width - 560) / 2)
        }
        areaBtn.snp.makeConstraints { (make) in
            make.top.equalTo(71)
            make.height.equalTo(30)
            make.width.equalTo(120)
            make.left.equalTo(typeBtn.snp.right).offset(100)
        }
        typeBtn.snp.makeConstraints { (make) in
            make.top.equalTo(71)
            make.height.equalTo(30)
            make.width.equalTo(120)
            make.left.equalTo((UIScreen.width - 560) / 2)
        }

    }
    let screenViewModel:FTScreeningViewModel = FTScreeningViewModel()
    lazy var screenTable:FTScreeningTableView = {
        let view:FTScreeningTableView = FTScreeningTableView(frame: CGRect.init(x: 0, y: 108, width: self.view.frame.size.width, height: 0), style: .plain)
        view.dele = self
        return view
    }()
    lazy var areaScreen:FTScreeningCostAndAreaView = {
        let view:FTScreeningCostAndAreaView = FTScreeningCostAndAreaView(frame:  CGRect.init(x: 0, y: 108, width: self.view.frame.size.width, height: 0))
        view.loadUI(cellViewModels: self.screenViewModel.areaCellViewModels)
        view.dele = self
        return view
    }()
    lazy var costScreen:FTScreeningCostAndAreaView = {
        let view:FTScreeningCostAndAreaView = FTScreeningCostAndAreaView(frame:  CGRect.init(x: 0, y: 108, width: self.view.frame.size.width, height: 0))
        view.loadUI(cellViewModels: self.screenViewModel.costCellViewModels)
        view.dele = self
        return view
    }()
    lazy var screenBackView:UIView = {
        let view:UIView = UIView(frame: CGRect.init(x: 0, y: 108, width: self.view.frame.size.width, height:self.view.frame.size.height - 70))
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
    lazy var lineView1:UIView = {
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
        text.delegate = self
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
    lazy var localBtn:UIButton = {
        let btn:UIButton = UIButton(type: .custom)
        btn.setTitle("本地", for: .normal)
        btn.setTitleColor(FTStyleConfiguration.b3b3b3, for: .normal)
        btn.setTitleColor(FTStyleConfiguration.red, for: .selected)
        btn.isSelected = true
        btn.titleLabel?.font = FTStyleConfiguration.font17bold
        btn.addTarget(self, action: #selector(localAction), for: .touchUpInside)
        return btn
    }()
    lazy var countrywideBtn:UIButton = {
        let btn:UIButton = UIButton(type: .custom)
        btn.setTitle("全国", for: .normal)
        btn.setTitleColor(FTStyleConfiguration.b3b3b3, for: .normal)
        btn.setTitleColor(FTStyleConfiguration.red, for: .selected)
        btn.titleLabel?.font = FTStyleConfiguration.font17bold
        btn.addTarget(self, action: #selector(countrywideAction), for: .touchUpInside)
        return btn
    }()
    lazy var topLine:UIView = {
        let view:UIView = UIView()
        view.backgroundColor = FTStyleConfiguration.red
        return view
    }()
    func localAction() {
        localBtn.isSelected = true
        countrywideBtn.isSelected = false
        view.bringSubview(toFront: collectionView)
        topLine.snp.remakeConstraints { (make) in
            make.bottom.equalTo(0)
            make.left.equalTo(localBtn.snp.left)
            make.width.equalTo(50)
            make.height.equalTo(4)
        }
        
    }
    
    func countrywideAction() {
        localBtn.isSelected = false
        countrywideBtn.isSelected = true
        view.bringSubview(toFront: collectionView1)
        topLine.snp.remakeConstraints { (make) in
            make.bottom.equalTo(0)
            make.left.equalTo(countrywideBtn.snp.left)
            make.width.equalTo(50)
            make.height.equalTo(4)
        }
        
    }
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
            self.screenTable.frame = CGRect.init(x: 0, y: 108, width: self.view.frame.size.width, height: self.view.frame.size.height - 270)
        }
    }
    func hideType() {
        screenBackView.isHidden = true
        UIView.animate(withDuration: 0.5) {
            self.screenTable.frame = CGRect.init(x: 0, y: 108, width: self.view.frame.size.width, height: 0)
        }
    }
    func showArea() {
        screenBackView.isHidden = false
        UIView.animate(withDuration: 0.5) {
            self.areaScreen.frame = CGRect.init(x: 0, y: 108, width: self.view.frame.size.width, height: 120)
        }
    }
    func hideArea() {
        screenBackView.isHidden = true
        UIView.animate(withDuration: 0.5) {
            self.areaScreen.frame = CGRect.init(x: 0, y: 108, width: self.view.frame.size.width, height: 0)
        }
    }
    func showCost() {
        screenBackView.isHidden = false
        UIView.animate(withDuration: 0.5) {
            self.costScreen.frame = CGRect.init(x: 0, y: 108, width: self.view.frame.size.width, height: 120)
        }
    }
    func hideCost() {
        screenBackView.isHidden = true
        UIView.animate(withDuration: 0.5) {
            self.costScreen.frame = CGRect.init(x: 0, y: 108, width: self.view.frame.size.width, height: 0)
        }
    }
    lazy var collectionView:UICollectionView = {
        let  layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        //layout.sectionInset = UIEdgeInsetsMake(0, 25, 0, 25)
        layout.itemSize = CGSize(width: UIScreen.main.bounds.size.width / 2, height: UIScreen.main.bounds.size.width / 2 / 1.33 + 65)
        layout.headerReferenceSize = CGSize(width: self.view.frame.size.width, height: 65)
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
    lazy var collectionView1:UICollectionView = {
        let  layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        //layout.sectionInset = UIEdgeInsetsMake(0, 25, 0, 25)
        layout.itemSize = CGSize(width: UIScreen.main.bounds.size.width / 2, height: UIScreen.main.bounds.size.width / 2 / 1.33 + 65)
        layout.headerReferenceSize = CGSize(width: self.view.frame.size.width, height: 65)
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
        //真正
        topModels = FTRealKitchenService.fetchTopRealKitchens(withCityId: FTUserManager.userManager.getModel().userInfo.cityId)
        locationModels = FTRealKitchenService.fetchRealKitchens(withCityId: FTUserManager.userManager.getModel().userInfo.cityId)
        locationModels.insert(topModels, at: 0)
        allModels = FTRealKitchenService.fetchRealKitchens(withCityId: "")
        collectionView.reloadData()
        collectionView1.reloadData()

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
        headerLb.font = FTStyleConfiguration.font18bold
        headerLb.textColor=FTStyleConfiguration.d4d4d4
        self .addSubview(headerLb!)
        headerLb.snp.makeConstraints { (make) in
            make.left.equalTo(25)
            make.top.equalTo(25)
            make.height.equalTo(15)
        }
        headerLb1=UILabel()
        headerLb1.font = FTStyleConfiguration.font18bold
        headerLb1.textColor=FTStyleConfiguration.b3b3b3
        self .addSubview(headerLb1!)
        headerLb1.snp.makeConstraints { (make) in
            make.top.equalTo(25)
            make.left.equalTo(headerLb.snp.right).offset(15)
            make.height.equalTo(15)
        }
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension FTSceneryViewController:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,FTScreeningTableViewDeleage,FTScreeningCostAndAreaViewDeleage,UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if countrywideBtn.isSelected{
            allModels = FTRealKitchenService.fetchRealKitchens(withCityId: FTUserManager.userManager.getModel().userInfo.cityId, estateName: searchText.text!)
            collectionView1.reloadData()
        }else{
            locationModels = FTRealKitchenService.fetchRealKitchens(withCityId: FTUserManager.userManager.getModel().userInfo.cityId, estateName: searchText.text!)
            collectionView.reloadData()
        }

        return true
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionView{
            let cell:FTSceneryCollectionCell =  collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! FTSceneryCollectionCell
            let array:[FTRealKitchen] = locationModels[indexPath.section].list as! [FTRealKitchen]
            cell.loadModel(model: array[indexPath.row])
            return cell
        }
        let cell:FTSceneryCollectionCell =  collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! FTSceneryCollectionCell
        let array:[FTRealKitchen] = allModels[indexPath.section].list as! [FTRealKitchen]
        cell.loadModel(model: array[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionView{
            let array:[FTRealKitchen] = locationModels[section].list as! [FTRealKitchen]
            return array.count
        }
        let array:[FTRealKitchen] = allModels[section].list as! [FTRealKitchen]
        return array.count
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.collectionView{
            let array:[FTRealKitchen] = locationModels[indexPath.section].list as! [FTRealKitchen]
            let vc = FTSceneryDetailViewController()
            vc.model = array[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }else{
            let array:[FTRealKitchen] = allModels[indexPath.section].list as! [FTRealKitchen]
            let vc = FTSceneryDetailViewController()
            vc.model = array[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }

    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == self.collectionView{
            return locationModels.count
        }
        return allModels.count
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var model:FTRealKitchenList = FTRealKitchenList()
        if collectionView == self.collectionView{
            model = locationModels[indexPath.section]
        }else{
            model = allModels[indexPath.section]
        }
        switch kind{
        case UICollectionElementKindSectionHeader:
            let header:HeaderReusableView=collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! HeaderReusableView
            header.headerLb!.text = model.name
//            header.headerLb1.text = model.city
            return header
        default:
            return HeaderReusableView()
        }
    }
    func didSeletecedAction(title: String) {
        typeAction()
        productNum = title
        if countrywideBtn.isSelected{
            allModels = FTRealKitchenService.fetchRealKitchens(withCityId: FTUserManager.userManager.getModel().userInfo.cityId, productNumber: productNum, kitchenArea: area, fotileCost: cost, betweenCost: costMax)
            collectionView1.reloadData()
        }else{
            locationModels = FTRealKitchenService.fetchRealKitchens(withCityId: FTUserManager.userManager.getModel().userInfo.cityId, productNumber: productNum, kitchenArea: area, fotileCost: cost, betweenCost: costMax)
//            if topModels.count != 0 {
//                locationModels.insert(topModels[0], at: 0)
//            }
            collectionView.reloadData()
        }
    
    }
    func didSeletecedActionAreaCost(screenView: FTScreeningCostAndAreaView, title: String) {
        if costScreen == screenView{
            costAction()
            cost = title
            costMax = title
            if title == "1万以下"{
                cost = "0"
                costMax = "10000"
            }
            if title == "1万-2万"{
                cost = "10000"
                costMax = "20000"
            }
            if title == "2万-4万"{
                cost = "20000"
                costMax = "40000"
            }
            if title == "4万以上"{
                cost = "40000"
                costMax = "1000000"
            }
        }else{
            areaAction()
            area = title
            if title == "5-7平米"{
                area = "5-7"
            }
            if title == "8-10平米"{
                area = "8-10"
            }
            if title == "10平米以上"{
                area = "10"
            }
        }
        if countrywideBtn.isSelected{
            allModels = FTRealKitchenService.fetchRealKitchens(withCityId: FTUserManager.userManager.getModel().userInfo.cityId, productNumber: productNum, kitchenArea: area, fotileCost: cost, betweenCost: costMax)
            collectionView1.reloadData()
        }else{
            locationModels = FTRealKitchenService.fetchRealKitchens(withCityId: FTUserManager.userManager.getModel().userInfo.cityId, productNumber: productNum, kitchenArea: area, fotileCost: cost, betweenCost: costMax)
//            if topModels.count != 0 {
//                locationModels.insert(topModels[0], at: 0)
//            }
            collectionView.reloadData()
        }
 

    }

}
