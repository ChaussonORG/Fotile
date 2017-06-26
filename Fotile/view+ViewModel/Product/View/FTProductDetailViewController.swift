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
  
}
class FTProductDetailViewController: UIViewController {
    
    @IBOutlet var parmView: UIView!
    @IBOutlet var parmHeight: NSLayoutConstraint!
    var viewModel = FTProductDetailVM()
    @IBOutlet var headView: UIView!
    @IBOutlet var titleView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        loadUI()
        // Do any additional setup after loading the view.
    }
    func loadUI(){
        productImage.image = viewModel.headViewModel?.imageUrl
        let titleView = FTProductTitleView(frame: CGRect(), title: viewModel.headViewModel?.modelNumber, subTitle: viewModel.headViewModel?.name, desc: viewModel.headViewModel?.slogan)
        let productParmTitle = FTProductHeadView(title: "产品参数")
        self.edgesForExtendedLayout = .bottom
        view.addSubview(mainScrollView)
        view.addSubview(backBtn)

        mainScrollView.addSubview(productImage)
        mainScrollView.addSubview(titleView)
        mainScrollView.addSubview(productParmTitle)

        mainScrollView.snp.makeConstraints { (make) in
            make.left.top.bottom.right.equalTo(0)
        }
        productImage.snp.makeConstraints { (make) in
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
            make.top.equalTo(productImage.snp.bottom).offset(0)
            make.left.equalTo(0)
            make.width.equalTo(productImage)
            make.height.width.equalTo(120)
        }
        productParmTitle.snp.makeConstraints { (make) in
            make.top.equalTo(titleView.snp.bottom).offset(0)
            make.left.equalTo(0)
            make.width.equalTo(titleView)
            make.height.width.equalTo(140)
        }
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
    lazy var backBtn:UIButton = {
        let backBtn = UIButton(type: .custom)
        backBtn.setImage(UIImage(named:"btn_back"), for: .normal)
        backBtn.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        return backBtn
    }()
    lazy var bannerView:HYBLoopScrollView = {
        let bannerView:HYBLoopScrollView = HYBLoopScrollView(frame: CGRect.zero, imageUrls: ["home1"], timeInterval: 2, didSelect: {[weak self] (didIndex) in
            
            }, didScroll: nil)
        return bannerView
    }()
    lazy var productImage:UIImageView = {
        let productImage:UIImageView = UIImageView()
        
        productImage.backgroundColor = UIColor("#f4f4f4")
        productImage.contentMode = .scaleAspectFit
        return productImage
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
