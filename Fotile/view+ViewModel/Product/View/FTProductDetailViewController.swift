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

    class func news() -> FTProductDetailViewController {
        let story = UIStoryboard.init(name: "Product", bundle: nil)
        let vc = story.instantiateViewController(withIdentifier: "productDetail")
        return vc as! FTProductDetailViewController
    }
    var viewModel = FTProductDetailVM()
    @IBOutlet var headView: UIView!
    @IBOutlet var scollView: UIScrollView!
    @IBOutlet var backBtn: UIButton!
    @IBOutlet var view1: UIView!
    @IBOutlet var view2: UIView!
    @IBOutlet var view3: UIView!
    @IBOutlet var view4: UIView!
    @IBOutlet var view5: UIView!
    @IBOutlet var titleView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUI()
        refreshData()
        // Do any additional setup after loading the view.
    }
    func loadUI(){
        self.edgesForExtendedLayout = .bottom
        headView.addSubview(productImage)
        view.addSubview(backBtn)
        productImage.snp.makeConstraints { (make) in
            make.left.top.equalTo(0)
            make.width.equalTo(self.view.frame.size.width)
            make.height.equalTo(450)
        }
        view1.addSubview(collectionView1)
        collectionView1.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.top.equalTo(150)
            make.width.equalTo(self.view.frame.size.width)
            make.height.equalTo(460)
        }
        view2.addSubview(collectionView2)
        collectionView2.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.top.equalTo(150)
            make.width.equalTo(self.view.frame.size.width)
            make.height.equalTo(300)
        }
        view3.addSubview(collectionView3)
        collectionView3.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.top.equalTo(475)
            make.width.equalTo(self.view.frame.size.width)
            make.height.equalTo(200)
        }
        view4.addSubview(collectionView4)
        collectionView4.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.top.equalTo(150)
            make.width.equalTo(self.view.frame.size.width)
            make.height.equalTo(200)
        }
        view5.addSubview(collectionView5)
        collectionView5.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.top.equalTo(150)
            make.width.equalTo(self.view.frame.size.width)
            make.height.equalTo(200)
        }
    }
    func refreshData() {
        productImage.image = viewModel.headViewModel?.imageUrl
        if let t = viewModel.headViewModel?.modelNumber {
            let title:UILabel = titleView.viewWithTag(1) as! UILabel
            title.text = "\(t) · "
        }
        if let n = viewModel.headViewModel?.name {
            let subTitle:UILabel = titleView.viewWithTag(2) as! UILabel
            subTitle.text = n
        }
        if let s = viewModel.headViewModel?.slogan {
            let desc:UILabel = titleView.viewWithTag(3) as! UILabel
            desc.text = s
        }
      
    }
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
    lazy var collectionView2:UICollectionView = {
        let  layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 25
        layout.minimumLineSpacing = 25
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 25)
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: self.view.frame.size.width - 100, height: 300)
        let collectionView:UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.collectionViewLayout = layout
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(FTDetailCollectionViewCell1.self, forCellWithReuseIdentifier: "cellId2")
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

    @IBAction func backAction(_ sender: Any) {
        _ = navigationController?.popToRootViewController(animated: true)
    }
//
//    lazy var scrollView1:HYBLoopScrollView = {
//        let scorllView:HYBLoopScrollView = HYBLoopScrollView(frame: CGRect.zero, imageUrls: ["home1"], timeInterval: 2, didSelect: {[weak self] (didIndex) in
//            
//            }, didScroll: nil)
//        return scorllView
//    }()
    lazy var productImage:UIImageView = {
        let productImage:UIImageView = UIImageView()
       
        productImage.backgroundColor = UIColor("#f4f4f4")
        productImage.contentMode = .scaleAspectFit
        return productImage
    }()
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pushMoreAction(_ sender: Any) {
        let vc = FTGraduateViewController.news()
        navigationController?.pushViewController(vc, animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        (UIApplication.shared.delegate as! AppDelegate).tabbar?.tabBar.isHidden = true
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
