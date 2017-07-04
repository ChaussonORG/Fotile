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
    var series:FTProductSeries?
    var moreModelNumber:Array<FTProduct>?
    var othersProcuts:Array<FTProduct>?
    var isShowBanner:Bool {
        get{
            return banners.count > 0
        }
    }
    var isShowMore:Bool {
        get{
            return moreModelNumber != nil
        }
    }
    var isShowOhter:Bool {
        get{
            return othersProcuts != nil
        }
    }
    var isShowSeries:Bool {
        get{
            return (series?.products != nil) && series != nil
        }
    }
    var banners:Array<FTProductHL> = Array<FTProductHL>()
    init(cellViewModel:FTProductCellViewModel) {
        self.headViewModel = cellViewModel
        let id = cellViewModel.productId
        let prdocutHLS = FTProductService.fetchHeightLight(withId:id)
   
        self.installImage = FTProductService.fetchInstallImage(withId: id)
        self.series = FTProductService.fetchSeries(withId: id)
        self.moreModelNumber = FTProductService.fetchMoreProduct(withId: id)
        self.othersProcuts = FTProductService.fetchOthersProduct(withId: id)

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
        MobClick.event("ProductDetail", attributes: ["number":viewModel.headViewModel?.modelNumber])
        loadUI()
        // Do any additional setup after loading the view.
    }
    var isVer:Bool = true
   
    func loadUI(){
        productImage.image = viewModel.headViewModel?.imageUrl
        let titleView = FTProductTitleView(frame: CGRect(), title: viewModel.headViewModel?.modelNumber, subTitle: viewModel.headViewModel?.name, desc: viewModel?.headViewModel?.slogan)
        let productParmTitle = FTProductHeadView(title: "产品参数")
        let installHeadView = FTProductHeadView(title: "安装示意图")
        let moreHeadView = FTProductHeadView(title: "更多型号")
        let otherHeadView = FTProductHeadView(title: "搭配建议")

        let headHeight = 140
        self.edgesForExtendedLayout = .bottom
        view.addSubview(mainScrollView)
        view.addSubview(backBtn)
        mainScrollView.addSubview(contentView)

        contentView.addSubview(productImageView)
        contentView.addSubview(titleView)
        contentView.addSubview(productParmTitle)
        contentView.addSubview(parmView)
        contentView.addSubview(bannerHead)
        contentView.addSubview(bannerView)
        contentView.addSubview(installHeadView)
        contentView.addSubview(installView)
        contentView.addSubview(seriesHeadView)
        contentView.addSubview(seriesView)
        contentView.addSubview(seriesCollectionView)
        contentView.addSubview(moreHeadView)
        contentView.addSubview(moreCollectView)

        contentView.addSubview(otherHeadView)
        contentView.addSubview(otherCollectView)

        contentView.addSubview(funView)


        mainScrollView.snp.makeConstraints { (make) in
            make.left.top.bottom.right.equalTo(0)
        }
        contentView.snp.makeConstraints { (make) in
            make.left.top.equalTo(0)
            make.width.equalTo(self.view)
            make.bottom.equalTo(funView.snp.bottom)
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
        seriesHeadView.snp.makeConstraints { (make) in
            let h = viewModel.isShowSeries ? headHeight:0
            if h == 0{
                seriesHeadView.isHidden = true
            }
            make.top.equalTo(installView.snp.bottom).offset(0)
            make.left.equalTo(0)
            make.width.equalTo(titleView)
            make.height.equalTo(h)
        }
        seriesView.snp.makeConstraints { (make) in
            let h = viewModel.isShowSeries ? 300:0
          
            make.top.equalTo(seriesHeadView.snp.bottom).offset(0)
            make.left.equalTo(0)
            make.width.equalTo(titleView)

            make.height.equalTo(h)
        }
        seriesCollectionView.snp.makeConstraints { (make) in
         
            let h = viewModel.isShowSeries ? 200:0

            make.top.equalTo(seriesView.snp.bottom).offset(25)
            make.left.equalTo(50)
            make.right.equalTo(self.view.snp.right).offset(0)
            make.height.equalTo(h)
        }
        moreHeadView.snp.makeConstraints { (make) in
            let h = viewModel.isShowMore ? headHeight:0
            if h == 0{
                moreHeadView.isHidden = true
            }
            make.top.equalTo(seriesCollectionView.snp.bottom).offset(0)
            make.left.equalTo(0)
            make.width.equalTo(titleView)
            make.height.equalTo(h)
        }
        moreCollectView.snp.makeConstraints { (make) in
            let h = viewModel.isShowMore ? 200:0
            make.top.equalTo(moreHeadView.snp.bottom).offset(25)
            make.left.equalTo(50)
            make.right.equalTo(self.view.snp.right).offset(0)
            make.height.equalTo(h)
        }
        otherHeadView.snp.makeConstraints { (make) in
            let h = viewModel.isShowOhter ? headHeight:0
            make.top.equalTo(moreCollectView.snp.bottom).offset(0)
            make.left.equalTo(0)
            make.width.equalTo(titleView)
            make.height.equalTo(h)
        }
        otherCollectView.snp.makeConstraints { (make) in
            let h = viewModel.isShowOhter ? 200:0
            make.top.equalTo(otherHeadView.snp.bottom).offset(25)
            make.left.equalTo(50)
            make.right.equalTo(self.view.snp.right).offset(0)
            make.height.equalTo(h)
        }
        funView.snp.makeConstraints { (make) in
            make.top.equalTo(otherCollectView.snp.bottom).offset(0)
            make.left.equalTo(0)
            make.width.equalTo(titleView)
            make.height.equalTo(0)
        }
//        let contentH = 3400+2*headHeight - (viewModel.isShowBanner ? 0:460+headHeight) - (viewModel.isShowSeries ? 0 :500+headHeight)-(viewModel.isShowMore ? 0 :200+headHeight)-(viewModel.isShowOhter ? 0 :200+headHeight)
//        mainScrollView.contentSize = CGSize(width: 0, height: contentH)

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
        backgroundImage.image = UIImage(named: "backgroundBlack")
        productImageView.addSubview(self.productImage)

        productImageView.addSubview(backgroundImage)
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
    lazy var contentView:UIView = {
        let contentView = UIView()
 
        
        return contentView
    }()
    lazy var seriesHeadView:FTProductHeadView = {
        let name = self.viewModel.series?.name ?? ""
        let seriesHeadView:FTProductHeadView = FTProductHeadView(title:name)
  
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
        funView.isHidden = true
        return funView
    }()
    lazy var mainScrollView:UIScrollView = {
        let mainScrollView = UIScrollView()
        return mainScrollView
    }()
    
    lazy var seriesView:UIView = {
        let seriesView = UIView()
        
        guard let p = self.viewModel.series?.image else{
            return seriesView

        }
        let seriesImageView = UIImageView()

        seriesImageView.contentMode = .scaleAspectFit

        seriesImageView.image = p.picture
        seriesView.addSubview(seriesImageView)
        seriesImageView.snp.makeConstraints({ (make) in
            make.top.equalTo(0)
            make.left.equalTo(50)
            make.right.equalTo(-50)
            make.bottom.equalTo(0)
        })
        return seriesView
    }()

    lazy var seriesCollectionView:UICollectionView = {
        let  layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 25
        layout.minimumLineSpacing = 25
//        layout.sectionInset = UIEdgeInsetsMake(0, 50, 0, 25)
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 200, height: 200)
        let collectionView:UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.collectionViewLayout = layout
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.tag = 9

        //        collectionView.isPagingEnabled = true
        collectionView.register(FTdetailCollectionViewCell2.self, forCellWithReuseIdentifier: "product")
        return collectionView
    }()
    lazy var moreCollectView:UICollectionView = {
        let  layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 25
        layout.minimumLineSpacing = 25
        //        layout.sectionInset = UIEdgeInsetsMake(0, 50, 0, 25)
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 200, height: 200)
        let moreCollectView:UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        moreCollectView.backgroundColor = UIColor.white
        moreCollectView.collectionViewLayout = layout
        moreCollectView.showsHorizontalScrollIndicator = false
        moreCollectView.delegate = self
        moreCollectView.tag = 10

        moreCollectView.dataSource = self
        //        collectionView.isPagingEnabled = true
        moreCollectView.register(FTdetailCollectionViewCell2.self, forCellWithReuseIdentifier: "product")
        return moreCollectView
    }()
    lazy var otherCollectView:UICollectionView = {
        let  layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 25
        layout.minimumLineSpacing = 25
        //        layout.sectionInset = UIEdgeInsetsMake(0, 50, 0, 25)
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 200, height: 200)
        let otherCollectView:UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        otherCollectView.backgroundColor = UIColor.white
        otherCollectView.collectionViewLayout = layout
        otherCollectView.showsHorizontalScrollIndicator = false
        otherCollectView.delegate = self
        otherCollectView.tag = 11
        otherCollectView.dataSource = self
        //        collectionView.isPagingEnabled = true
        otherCollectView.register(FTdetailCollectionViewCell2.self, forCellWithReuseIdentifier: "product")
        return otherCollectView
    }()

    func backAction(_ sender: Any) {
        _ = navigationController?.popToRootViewController(animated: true)
    }

    func pushMoreAction(_ sender: Any) {
        MobClick.event("Fun")
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
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let h = contentView.frame.maxY
        mainScrollView.contentSize = CGSize(width: 0, height: h)

    }


}
extension FTProductDetailViewController:UIScrollViewDelegate{
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        print("\(scrollView.contentOffset.x)")
        
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
      
        let index = Int(scrollView.contentOffset.x/(scrollView.frame.size.width-50))
    
        bannerHead.changeHead(index: index)
        print("\(scrollView.contentOffset.x)")

    }
}
extension FTProductDetailViewController:UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell:FTdetailCollectionViewCell2 =  collectionView.dequeueReusableCell(withReuseIdentifier: "product", for: indexPath) as! FTdetailCollectionViewCell2
        if collectionView.tag  == moreCollectView.tag {
            guard let m = self.viewModel.moreModelNumber else {
                return cell
            }
            let product = m[indexPath.row]
            cell.label1.text = product.modelNumber
            cell.label2.isHidden = true

            if product.thumnailImage != nil{
                cell.imageV.image = product.thumnailImage.picture
                
            }
            if let color = product.color {
                cell.imageV.backgroundColor = UIColor(color)
                
            }
        }else if collectionView.tag == otherCollectView.tag {
    
            guard let o = self.viewModel.othersProcuts else {
                return cell
            }
            let product = o[indexPath.row]
            cell.label1.text = product.name
            cell.label2.text = product.modelNumber
            if product.thumnailImage != nil{
                cell.imageV.image = product.thumnailImage.picture

            }
            if let color = product.color {
                cell.imageV.backgroundColor = UIColor(color)
                
            }
        }else{
            guard let p = self.viewModel.series?.products else {
                return cell
            }
            let product = p[indexPath.row]
            cell.label1.text = product.name
            cell.label2.text = product.modelNumber
            if product.thumnailImage != nil{
                cell.imageV.image = product.thumnailImage.picture
                
            }
            if let color = product.color {
                cell.imageV.backgroundColor = UIColor(color)

            }

        }
        return cell

       
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == moreCollectView.tag {
            guard let n = self.viewModel.moreModelNumber else {
                return 0
            }
            return n.count
            
        }else if collectionView.tag == otherCollectView.tag {
            guard let n = self.viewModel.othersProcuts else {
                return 0
            }
            return n.count
        }
        guard let n = self.viewModel.series?.products else {
            return 0
        }
        return n.count
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var product:FTProduct?
        if collectionView.tag == moreCollectView.tag {
            product  = self.viewModel.moreModelNumber?[indexPath.row]

        }else if collectionView.tag == otherCollectView.tag {
            product  = self.viewModel.othersProcuts?[indexPath.row]

        }else{
            product  = self.viewModel.series?.products[indexPath.row]

        }
        
        
        let vm = FTProductDetailVM(cellViewModel:getCellVieModel(product: product!))
        let vc = FTProductDetailViewController()
        vc.viewModel = vm
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

