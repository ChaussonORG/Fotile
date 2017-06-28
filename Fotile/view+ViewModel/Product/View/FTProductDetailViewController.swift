//
//  FTProductDetailViewController.swift
//  Fotile
//
//  Created by 郭金涛 on 2017/5/21.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit
import HYBLoopScrollView
struct FTProductDetailVM {
    var headViewModel:FTProductCellViewModel?
    var installImage:FTImage?
    var isShowBanner:Bool {
        get{
            return banners.count > 0
        }
    }
    var banners:Array<FTProductHL> = Array<FTProductHL>()
    init(cellViewModel:FTProductCellViewModel) {
        self.headViewModel = cellViewModel
    
        let prdocutHLS = FTProductService.fetchHeightLight(withId: cellViewModel.productId)
   
        self.installImage = FTProductService.fetchInstallImage(withId: cellViewModel.productId)
        guard let p = prdocutHLS else {
            return
        }
        for b in p {
            banners.append(b)
        }
     
    }
}
class FTProductDetailViewController: UIViewController {
    
    var viewModel:FTProductDetailVM!
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        loadUI()
        // Do any additional setup after loading the view.
    }
    var isVer:Bool = true
   
    func loadUI(){
        productImage.image = viewModel.headViewModel?.imageUrl
        let titleView = FTProductTitleView(frame: CGRect(), title: viewModel.headViewModel?.modelNumber, subTitle: viewModel.headViewModel?.name, desc: viewModel?.headViewModel?.slogan)
        let productParmTitle = FTProductHeadView(title: "产品参数")
        let installHeadView = FTProductHeadView(title: "安装示意图")

        let headHeight = 140
        let isHiddenBanner = viewModel.banners

        self.edgesForExtendedLayout = .bottom
        view.addSubview(mainScrollView)
        view.addSubview(backBtn)
//
        mainScrollView.addSubview(productImageView)
        mainScrollView.addSubview(titleView)
        mainScrollView.addSubview(productParmTitle)
        mainScrollView.addSubview(parmView)
        mainScrollView.addSubview(bannerHead)
        mainScrollView.addSubview(bannerView)
        mainScrollView.addSubview(installHeadView)
        mainScrollView.addSubview(installView)
        mainScrollView.addSubview(funView)

//        mainScrollView.addSubview(seriesHeadView)
  

        mainScrollView.snp.makeConstraints { (make) in
            make.left.top.bottom.right.equalTo(0)
        }
        productImageView.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.width.equalTo(self.view)
            make.height.equalTo(450)
        }
        backBtn.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.left.equalTo(10)
            make.height.width.equalTo(60)
        }
        titleView.snp.makeConstraints { (make) in
            make.top.equalTo(productImageView.snp.bottom).offset(0)
            make.left.equalTo(0)
            make.width.equalTo(productImageView)
            make.height.equalTo(120)
        }
        installHeadView.snp.makeConstraints { (make) in
            make.top.equalTo(bannerView.snp.bottom).offset(0)
            make.left.equalTo(0)
            make.width.equalTo(titleView)
            make.height.equalTo(headHeight)
        }
        productParmTitle.snp.makeConstraints { (make) in
            make.top.equalTo(titleView.snp.bottom).offset(0)
            make.left.equalTo(0)
            make.width.equalTo(titleView)
            make.height.equalTo(headHeight)
        }
        let parmViewH = { Void -> Int in
            let count = self.viewModel.headViewModel?.params.count
            
            return count!/2*45+count!%2*45
        }()
        parmView.snp.makeConstraints { (make) in
            make.top.equalTo(productParmTitle.snp.bottom).offset(0)
            make.left.equalTo(0)
            make.width.equalTo(titleView)
            make.height.equalTo(parmViewH)
        }
        bannerHead.snp.makeConstraints { (make) in
            var h = headHeight
            if !viewModel.isShowBanner {
                h = 0
            }
            make.top.equalTo(parmView.snp.bottom).offset(0)
            make.left.equalTo(0)
            make.width.equalTo(titleView)
            make.height.equalTo(h)
        }
        bannerView.snp.makeConstraints { (make) in
            var h = 460
             if !viewModel.isShowBanner {
                h = 0
            }
            make.top.equalTo(bannerHead.snp.bottom).offset(0)
            make.left.equalTo(0)
            make.width.equalTo(titleView)
            make.height.equalTo(h)
        }
        installView.snp.makeConstraints { (make) in
            make.top.equalTo(installHeadView.snp.bottom).offset(0)
            make.left.equalTo(0)
            make.width.equalTo(titleView)
            make.height.equalTo(570)
        }
//        seriesHeadView.snp.makeConstraints { (make) in
//            make.top.equalTo(installView.snp.bottom).offset(0)
//            make.left.equalTo(0)
//            make.width.equalTo(titleView)
//            make.height.equalTo(headHeight)
//        }
        funView.snp.makeConstraints { (make) in
            make.top.equalTo(installView.snp.bottom).offset(0)
            make.left.equalTo(0)
            make.width.equalTo(titleView)
            make.height.equalTo(185)
        }
        let contentHeight = seriesHeadView.systemLayoutSizeFitting(UILayoutFittingCompressedSize).height+seriesHeadView.hyb_bottomY
              
        mainScrollView.contentSize = CGSize(width: 0, height: 2600)
//        view1.addSubview(collectionView1)
//        collectionView1.snp.makeConstraints { (make) in
//            make.left.equalTo(0)
//            make.top.equalTo(150)
//            make.width.equalTo(self.view.frame.size.width)
//            make.height.equalTo(460)
//        }
//
//        view3.addSubview(collectionView3)
//        collectionView3.snp.makeConstraints { (make) in
//            make.left.equalTo(0)
//            make.top.equalTo(475)
//            make.width.equalTo(self.view.frame.size.width)
//            make.height.equalTo(200)
//        }
//        view4.addSubview(collectionView4)
//        collectionView4.snp.makeConstraints { (make) in
//            make.left.equalTo(0)
//            make.top.equalTo(150)
//            make.width.equalTo(self.view.frame.size.width)
//            make.height.equalTo(200)
//        }
//        view5.addSubview(collectionView5)
//        collectionView5.snp.makeConstraints { (make) in
//            make.left.equalTo(0)
//            make.top.equalTo(150)
//            make.width.equalTo(self.view.frame.size.width)
//            make.height.equalTo(200)
//        }
    }
    func refreshData() {
        
      
    }
    
    lazy var parmView:FTProductParmView = {
        let parmView = FTProductParmView(params: self.viewModel.headViewModel?.params)
     
        return parmView
    }()
    lazy var bannerHead:FTProductHeadView = {
        let bannerHead = FTProductHeadView(title: "")

        var titles:Array<String> = Array<String>()

        for b in self.viewModel.banners {
            titles.append(b.title)
            
        }
        if titles.count > 0{
            bannerHead.setupHeaders(heads: titles)

        }
        
        return bannerHead
        
    }()
    lazy var bannerView:FTProductBannerView = {
        
        var images:Array<FTImage> = Array<FTImage>()
        
        for b in self.viewModel.banners {
            images.append(b.image)
            
        }
        let frame = CGRect(x: 50, y: 0, width: self.view.frame.size.width-100, height: 460)
        let bannerView = FTProductBannerView(frame:frame,images: images)
        bannerView.scrollView.delegate = self;
        
        return bannerView
        
    }()
    lazy var installView:UIView = {
        let imageView = UIImageView(image: self.viewModel?.installImage?.picture)

        let installView = UIView()
        installView.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalTo(0)
        }
        imageView.contentMode = .scaleAspectFit
        return installView
        
    }()
    
    lazy var backBtn:UIButton = {
        let backBtn = UIButton(type: .custom)
        backBtn.setImage(UIImage(named:"btn_back"), for: .normal)
        backBtn.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        return backBtn
    }()
    lazy var productImageView:UIView = {
        let productImageView:UIView = UIView()
        let backgroundImage:UIImageView = UIImageView()
        productImageView.addSubview(backgroundImage)
        productImageView.addSubview(self.productImage)
        backgroundImage.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(0)
        }
        self.productImage.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(0)
        }
        return productImageView
    }()
    lazy var seriesHeadView:FTProductHeadView = {
        let seriesHeadView:FTProductHeadView = FTProductHeadView(title:"智能套系")
  
        return seriesHeadView
    }()
    lazy var productImage:UIImageView = {
        let productImage:UIImageView = UIImageView()
        
        productImage.backgroundColor = UIColor("#f4f4f4")
        productImage.contentMode = .scaleAspectFit
        return productImage
    }()
    lazy var funView:FTProductFunView = {
        let funView:FTProductFunView = FTProductFunView()
        funView.tapView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(pushMoreAction))
        funView.tapView.addGestureRecognizer(tap)
        return funView
    }()
    lazy var mainScrollView:UIScrollView = {
        let mainScrollView = UIScrollView()
        return mainScrollView
    }()
    
    lazy var collectionView1:UICollectionView = {
        let  layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 25
        layout.minimumLineSpacing = 25
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 25)
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: self.view.frame.size.width - 100, height: 460)
        let collectionView:UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.collectionViewLayout = layout
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
//        collectionView.isPagingEnabled = true
        collectionView.register(FTDetailCollectionViewCell1.self, forCellWithReuseIdentifier: "cellId1")
        return collectionView
    }()

    lazy var collectionView3:UICollectionView = {
        let  layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 25
        layout.minimumLineSpacing = 25
        layout.sectionInset = UIEdgeInsetsMake(0, 50, 0, 25)
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 200, height: 200)
        let collectionView:UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.collectionViewLayout = layout
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        //        collectionView.isPagingEnabled = true
        collectionView.register(FTdetailCollectionViewCell2.self, forCellWithReuseIdentifier: "cellId3")
        return collectionView
    }()
    lazy var collectionView4:UICollectionView = {
        let  layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 25
        layout.minimumLineSpacing = 25
        layout.sectionInset = UIEdgeInsetsMake(0, 50, 0, 25)
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 200, height: 200)
        let collectionView:UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.collectionViewLayout = layout
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        //        collectionView.isPagingEnabled = true
        collectionView.register(FTDetailCollectionViewCell3.self, forCellWithReuseIdentifier: "cellId4")
        return collectionView
    }()

    lazy var collectionView5:UICollectionView = {
        let  layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 25
        layout.minimumLineSpacing = 25
        layout.sectionInset = UIEdgeInsetsMake(0, 50, 0, 25)
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 200, height: 175)
        let collectionView:UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.collectionViewLayout = layout
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(FTdetailCollectionViewCell2.self, forCellWithReuseIdentifier: "cellId5")
        return collectionView
    }()

    func backAction(_ sender: Any) {
        _ = navigationController?.popToRootViewController(animated: true)
    }

    func pushMoreAction(_ sender: Any) {
        let vc = FTGraduateViewController.news()
        navigationController?.pushViewController(vc, animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        (UIApplication.shared.delegate as! AppDelegate).tabbar?.tabBar.isHidden = true
        (UIApplication.shared.delegate as! AppDelegate).isAllow = false
        if !isVer{
            let value = UIInterfaceOrientation.portrait.rawValue
            UIDevice.current.setValue(value, forKey: "orientation")
        }
    
    }



}
extension FTProductDetailViewController:UIScrollViewDelegate{
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        print("\(scrollView.contentOffset.x)")
        
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
      
        var index = Int(scrollView.contentOffset.x/(scrollView.frame.size.width))
    
        bannerHead.changeHead(index: index)
        print("\(scrollView.contentOffset.x)")

    }
}
extension FTProductDetailViewController:UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionView1 {
            let cell:FTDetailCollectionViewCell1 =  collectionView.dequeueReusableCell(withReuseIdentifier: "cellId1", for: indexPath) as! FTDetailCollectionViewCell1
            return cell
        }
        if collectionView == collectionView3 {
            let cell:FTdetailCollectionViewCell2 =  collectionView.dequeueReusableCell(withReuseIdentifier: "cellId3", for: indexPath) as! FTdetailCollectionViewCell2
            return cell
        }
        if collectionView == collectionView4 {
            let cell:FTDetailCollectionViewCell3 =  collectionView.dequeueReusableCell(withReuseIdentifier: "cellId4", for: indexPath) as! FTDetailCollectionViewCell3
            return cell
        }
        if collectionView == collectionView5 {
            let cell:FTdetailCollectionViewCell2 =  collectionView.dequeueReusableCell(withReuseIdentifier: "cellId5", for: indexPath) as! FTdetailCollectionViewCell2
            return cell
        }
        let cell:FTDetailCollectionViewCell1 =  collectionView.dequeueReusableCell(withReuseIdentifier: "cellId2", for: indexPath) as! FTDetailCollectionViewCell1
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
