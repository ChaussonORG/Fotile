//
//  FTInteractionDetailViewController.swift
//  Fotile
//
//  Created by 郭金涛 on 2017/5/10.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit
import CHProgressHUD
enum kitType {
    case Day1
    case Day2
    case Day3
    case Ninght1
    case Ninght2
    case Ninght3
}

class FTInteractionDetailViewController: UIViewController {

    let viewModel:FTInteractionDetailViewModel = FTInteractionDetailViewModel()
    var model:FTCustomKTDetail = FTCustomKTDetail()
    var productModels:Array<FTProduct> = Array<FTProduct>()
    var isVer:Bool = true
    @IBOutlet var popBtn: UIButton!
    var type:kitType = .Day2
    var typeIndex = 1
    var typeIndex1 = 1
    var isSame:Bool = false
    @IBOutlet var pushBtn: UIButton!
    @IBOutlet var dayNightBtn: UIButton!
    
    var rect:CGRect = CGRect()
    let spac = (UIScreen.main.bounds.size.height - UIScreen.main.bounds.size.width) / 2
    override func viewDidLoad() {
        super.viewDidLoad()
        animationUI()
        self.loadUI()
        self.layoutView()
        // Do any additional setup after loading the view.
    }
    func loadUI()  {
        chooseType(index:1)
        view.addSubview(scrollView)
        view.addSubview(backgroundView)
        backgroundView.addSubview(collectionView)
        backgroundView.addSubview(sliderView)
        backgroundView.addSubview(sliderView1)
//        sliderView.deleage = self
//        sliderView1.deleage = self
        backgroundView.addSubview(pushBtn)
        scrollView.addSubview(night1)
        scrollView.addSubview(night3)
        scrollView.addSubview(night2)
        
        scrollView.addSubview(day1)
        scrollView.addSubview(day3)
        scrollView.addSubview(day2)
        scrollView.addSubview(ninghtView)
        
        view.addSubview(popBtn)
        view.addSubview(dayNightBtn)
        view.addSubview(switchView)
        switchView.addSubview(productBtn)
        switchView.addSubview(materialBtn)
        day2.backImageView.image = model.groupImage.day2.picture
        day1.backImageView.image = model.groupImage.day1.picture
        day3.backImageView.image = model.groupImage.day3.picture
        night1.backImageView.image = model.groupImage.night1.picture
        night2.backImageView.image = model.groupImage.night2.picture
        night3.backImageView.image = model.groupImage.night3.picture
        sliderView1.isHidden = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(fullScreen))
        scrollView.addGestureRecognizer(tap)
    }
    func animationUI() {
        if self.rect.origin.y >  UIScreen.main.bounds.size.width - 292{
            self.rect.origin.y = UIScreen.main.bounds.size.width - 292
        }
        scrollView.isHidden = true
        view.addSubview(animationImageView)
        UIView.animate(withDuration: 0.5, animations: {
            self.animationImageView.frame = CGRect.init(x: -self.spac, y: 0, width: UIScreen.main.bounds.size.height, height: UIScreen.main.bounds.size.height - 254)
        }) { (bool) in
            self.scrollView.isHidden = false
            self.animationImageView.isHidden = true
        }
    }
    lazy var backgroundView:UIView = {
        let view:UIView = UIView()
        view.backgroundColor = UIColor.white
        return view
    }()
    lazy var animationImageView:UIImageView = {
        let imageV:UIImageView = UIImageView()
        imageV.image = self.model.groupImage.day2.picture
        imageV.frame = self.rect
        return imageV
    }()
    lazy var day1:FTBaseLayerView = {
        let imageView:FTBaseLayerView = FTBaseLayerView()
        return imageView
    }()
    lazy var day2:FTBaseLayerView = {
        let imageView:FTBaseLayerView = FTBaseLayerView()
        return imageView
    }()
    lazy var day3:FTBaseLayerView = {
        let imageView:FTBaseLayerView = FTBaseLayerView()
        return imageView
    }()
    lazy var night1:FTBaseLayerView = {
        let imageView:FTBaseLayerView = FTBaseLayerView()
        return imageView
    }()
    lazy var night2:FTBaseLayerView = {
        let imageView:FTBaseLayerView = FTBaseLayerView()
        return imageView
    }()
    lazy var night3:FTBaseLayerView = {
        let imageView:FTBaseLayerView = FTBaseLayerView()
        return imageView
    }()
    func layoutView() {
        scrollView.snp.remakeConstraints { (make) in
            make.left.equalTo(-spac)
            make.width.equalTo(UIScreen.main.bounds.size.height)
            make.bottom.equalTo(sliderView.snp.top).offset(0)
            make.top.equalTo(0)
        }
        day1.snp.remakeConstraints { (make) in
            make.left.equalTo(0)
            make.top.equalTo(0)
            make.width.equalTo(scrollView)
            make.height.equalTo(UIScreen.main.bounds.size.height - 254)
        }
        day2.snp.remakeConstraints { (make) in
            make.left.equalTo(day1.snp.right).offset(0)
            make.width.equalTo(scrollView)
            make.top.equalTo(0)
            make.height.equalTo(UIScreen.main.bounds.size.height - 254)
        }
        day3.snp.remakeConstraints { (make) in
            make.left.equalTo(day2.snp.right).offset(0)
            make.width.equalTo(scrollView)
            make.top.equalTo(0)
            make.height.equalTo(UIScreen.main.bounds.size.height - 254)
        }
        night1.snp.remakeConstraints { (make) in
            make.left.equalTo(0)
            make.top.equalTo(0)
            make.width.equalTo(scrollView)
            make.height.equalTo(UIScreen.main.bounds.size.height - 254)
        }
        night2.snp.remakeConstraints { (make) in
            make.left.equalTo(night1.snp.right).offset(0)
            make.width.equalTo(scrollView)
            make.top.equalTo(0)
            make.height.equalTo(UIScreen.main.bounds.size.height - 254)
        }
        night3.snp.remakeConstraints { (make) in
            make.left.equalTo(night2.snp.right).offset(0)
            make.width.equalTo(scrollView)
            make.top.equalTo(0)
            make.height.equalTo(UIScreen.main.bounds.size.height - 254)
        }
        dayNightBtn.snp.remakeConstraints { (make) in
            make.right.equalTo(view).offset(0)
            make.bottom.equalTo(day2)
            make.width.height.equalTo(70)
        }
        pushBtn.snp.remakeConstraints { (make) in
            make.left.equalTo(UIScreen.main.bounds.size.width / 2 - 25)
            make.bottom.equalTo(0)
            make.height.equalTo(25)
            make.width.equalTo(50)
        }
        sliderView.snp.remakeConstraints { (make) in
            make.left.right.equalTo(0)
            make.bottom.equalTo(collectionView.snp.top).offset(0)
            make.height.equalTo(44)
        }
        backgroundView.snp.makeConstraints { (make) in
            make.bottom.left.right.equalTo(0)
            make.height.equalTo(254)
        }
        collectionView.snp.remakeConstraints { (make) in
            make.left.right.equalTo(0)
            make.bottom.equalTo(-45)
            make.height.equalTo(165)
        }
        switchView.snp.remakeConstraints { (make) in
            make.left.equalTo(view).offset(25)
            make.bottom.equalTo(day2).offset(-15)
            make.height.equalTo(40)
            make.width.equalTo(120)
        }
        productBtn.snp.remakeConstraints { (make) in
            make.left.equalTo(5)
            make.top.equalTo(5)
            make.height.equalTo(30)
            make.width.equalTo(55)
        }
        materialBtn.snp.remakeConstraints { (make) in
            make.left.equalTo(productBtn.snp.right).offset(0)
            make.top.equalTo(5)
            make.height.equalTo(30)
            make.width.equalTo(55)
        }
        popBtn.snp.remakeConstraints { (make) in
            make.left.equalTo(view).offset(0)
            make.top.equalTo(0)
            make.height.equalTo(85)
            make.width.equalTo(60)
        }
        
        //测试
        ninghtView.snp.remakeConstraints { (make) in
            make.left.equalTo(0)
            make.top.equalTo(0)
            make.width.equalTo(scrollView.contentSize.width)
            make.height.equalTo(UIScreen.main.bounds.size.width)
            
        }
        
    }
    lazy var collectionView:UICollectionView = {
        let collectionView:UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: self.layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.collectionViewLayout = self.layout
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(FTInteractionDetailCollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
        return collectionView
    }()
    lazy var layout:UICollectionViewFlowLayout = {
       let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 25
        layout.sectionInset = UIEdgeInsetsMake(0, 25, 0, 25)
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 25
        return layout
    }()
    
    lazy var sliderView:FTHorOptionsView = {
        let view:FTHorOptionsView = FTHorOptionsView(frame: .zero)
        view.deleage = self

        return view
    }()
    lazy var sliderView1:FTInterOptionView = {
        let view:FTInterOptionView = FTInterOptionView(frame: .zero)
        view.deleage = self

        return view
    }()
    
    lazy var scrollView:UIScrollView = {
        let scroll:UIScrollView = UIScrollView()
        scroll.contentSize = CGSize(width: UIScreen.main.bounds.size.height * 3, height: UIScreen.main.bounds.size.width)
        scroll.isPagingEnabled = true
        scroll.bounces = false
        scroll.delegate = self
        scroll.contentOffset = CGPoint(x: scroll.contentSize.width / 3, y: 0)
        scroll.showsHorizontalScrollIndicator = false
        return scroll
    }()
    lazy var switchView:UIView = {
        let view:UIView = UIView()
        view.backgroundColor = UIColor.white
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 18
        return view
    }()
    lazy var productBtn:UIButton = {
        let btn:UIButton = UIButton(type: .custom)
        btn.layer.masksToBounds = true
        btn.layer.cornerRadius = 14
        btn.setTitle("产品", for: .normal)
        btn.setTitleColor(FTStyleConfiguration.b3b3b3, for: .normal)
        btn.setTitleColor(UIColor.white, for: .selected)
        btn.backgroundColor = UIColor.black
        btn.addTarget(self, action: #selector(productAction), for: .touchUpInside)
        btn.isSelected = true
        btn.titleLabel?.numberOfLines = 0
        return btn
    }()
    lazy var materialBtn:UIButton = {
        let btn:UIButton = UIButton(type: .custom)
        btn.layer.masksToBounds = true
        btn.layer.cornerRadius = 14
        btn.setTitle("材质", for: .normal)
        btn.setTitleColor(FTStyleConfiguration.b3b3b3, for: .normal)
        btn.setTitleColor(UIColor.white, for: .selected)
        btn.backgroundColor = UIColor.white
        btn.addTarget(self, action: #selector(materialAction), for: .touchUpInside)
        btn.titleLabel?.numberOfLines = 0
        return btn
    }()
    func productAction() {
        if backgroundView.isHidden{
            fullScreen()
        }
        productBtn.isSelected = true
        materialBtn.isSelected = false
        productBtn.backgroundColor = UIColor.black
        materialBtn.backgroundColor = UIColor.white
        sliderView.isHidden = false
        if !isVer{
            sliderView1.isHidden = false
        }
        self.chooseType(index: 1)
        collectionView.reloadData()
    }
    func materialAction() {
        if backgroundView.isHidden{
            fullScreen()
        }
        materialBtn.isSelected = true
        productBtn.isSelected = false
        materialBtn.backgroundColor = UIColor.black
        productBtn.backgroundColor = UIColor.white
        sliderView.isHidden = true
        if !isVer{
            sliderView1.isHidden = true
        }
        self.chooseType(index: 10)
        collectionView.reloadData()
    }
    @IBAction func popAction(_ sender: Any) {
        navigationController?.popViewController(animated: false)
    }
    weak var customPesentationController: CommonPresentationController?
    @IBAction func pushAction(_ sender: Any) {
        CHProgressHUD.show(true)
        let vc = FTSchemeViewController()
        let navc:UINavigationController = UINavigationController(rootViewController: vc)
        vc.isVer = self.isVer
        vc.productModels = self.productModels
        let kitType:kitType = type
        type = .Day1
        selectedProduct()
        vc.array.append(self.graphics(bgView: day1))
        type = .Day2
        selectedProduct()
        vc.array.append(self.graphics(bgView: day2))
        type = .Day3
        selectedProduct()
        vc.array.append(self.graphics(bgView: day3))
        type = .Ninght1
        selectedProduct()
        vc.array.append(self.graphics(bgView: night1))
        type = .Ninght2
        selectedProduct()
        vc.array.append(self.graphics(bgView: night2))
        type = .Ninght3
        selectedProduct()
        vc.array.append(self.graphics(bgView: night3))
        type = kitType
        self.present(navc, animated: true, completion: {
            CHProgressHUD.hide(true)
        })
    }
    
    lazy var ninghtView:UIView = {
        let view:UIView = UIView()
        view.backgroundColor = UIColor.black
        view.alpha = 0.4
        view.isHidden = true
        return view
    }()
    @IBAction func dayNightAction(_ sender: Any) {
        if backgroundView.isHidden{
            fullScreen()
        }
        dayNightBtn.isSelected = !dayNightBtn.isSelected
        if dayNightBtn.isSelected {

            scrollView.bringSubview(toFront: night1)
            scrollView.bringSubview(toFront: night2)
            scrollView.bringSubview(toFront: night3)
            if self.scrollView.contentOffset.x == 0 {
                type = .Ninght1
            }
            if self.scrollView.contentOffset.x == scrollView.contentSize.width / 3{
                type = .Ninght2
            }
            if self.scrollView.contentOffset.x == scrollView.contentSize.width / 3 * 2 {
                type = .Ninght3
            }
            collectionView.reloadData()
        }else{
            scrollView.bringSubview(toFront: day1)
            scrollView.bringSubview(toFront: day2)
            scrollView.bringSubview(toFront: day3)
            if self.scrollView.contentOffset.x == 0 {
                type = .Day1
            }
            if self.scrollView.contentOffset.x == scrollView.contentSize.width / 3 {
                type = .Day2
            }
            if self.scrollView.contentOffset.x == scrollView.contentSize.width / 3 * 2 {
                type = .Day3
            }
            collectionView.reloadData()

        }
        selectedProduct()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        selectedProduct()
        (UIApplication.shared.delegate as! AppDelegate).isAllow = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        (UIApplication.shared.delegate as! AppDelegate).isAllow = false
    }
    func chooseType(index:Int32)  {
       
        if index == 10{
            viewModel.materialS.removeAll()
            for model in model.materials {
                viewModel.materialS.append(model)
            }
            if isVer{
                collectionView.snp.updateConstraints({ (make) in
                    make.height.equalTo(200)
                })
                sliderView.snp.updateConstraints({ (male) in
                    male.height.equalTo(0)
                })
            }else{
                collectionView.snp.updateConstraints({ (make) in
                    make.width.equalTo(200)
                })
                sliderView1.snp.updateConstraints({ (male) in
                    male.width.equalTo(0)
                })
            }
           
        }else{
             viewModel.cellViewModels.removeAll()
            for model in model.products {
                if  model.catalogType == index{
                    viewModel.cellViewModels.append(model)
                }
            }
            if isVer{
                collectionView.snp.updateConstraints({ (make) in
                    make.height.equalTo(165)
                })
                sliderView.snp.updateConstraints({ (male) in
                    male.height.equalTo(44)
                })
            }else{
                collectionView.snp.updateConstraints({ (make) in
                    make.width.equalTo(165)
                })
                sliderView1.snp.updateConstraints({ (male) in
                    male.width.equalTo(44)
                })
            }
           
        }
        typeIndex1 = Int(index)
        typeIndex = Int(index)
        collectionView.reloadData()
    }
    func chooseProduct(imageView:FTBaseLayerView,image:UIImage) {
        switch typeIndex {
        case 1:
            imageView.imageView1.image = image
        case 2:
            imageView.imageView2.image = image
        case 3:
            imageView.imageView3.image = image
        case 4:
            imageView.imageView4.image = image
        case 5:
            imageView.imageView5.image = image
        case 6:
            imageView.imageView6.image = image
        case 7:
            imageView.imageView7.image = image
        case 8:
            imageView.imageView8.image = image
        case 9:
            imageView.imageView9.image = image
        case 10:
            imageView.imageView10.image = image
        default:
            break
        }
    }
    func selectedProduct() {
        for mp in model.products {
            mp.groupImage.day1.picture = nil
            mp.groupImage.day2.picture = nil
            
            mp.groupImage.day3.picture = nil
            
            mp.groupImage.night1.picture = nil
            mp.groupImage.night2.picture = nil
            
            mp.groupImage.night3.picture = nil
            
        }
        switch type {
        case .Day1:
            
            for p in productModels {
                typeIndex = Int(p.catalogType)
                chooseProduct(imageView: day1, image: p.groupImage.day1.picture)
            }
            model.groupImage.day2.picture = nil
            model.groupImage.day3.picture = nil
            model.groupImage.night2.picture = nil
            model.groupImage.night3.picture = nil
            model.groupImage.night1.picture = nil

            day2.clear()
            day3.clear()
            night1.clear()
            night2.clear()
            night3.clear()

            break
        case .Day2:
            for p in productModels {
                typeIndex = Int(p.catalogType)
                chooseProduct(imageView: day2, image: p.groupImage.day2.picture)
            }
            model.groupImage.day1.picture = nil
            model.groupImage.day3.picture = nil
            model.groupImage.night2.picture = nil
            model.groupImage.night3.picture = nil
            model.groupImage.night1.picture = nil

            day1.clear()
            day3.clear()
            night1.clear()
            night2.clear()
            night3.clear()
            break
        case .Day3:
            for p in productModels {
                typeIndex = Int(p.catalogType)

                chooseProduct(imageView: day3, image: p.groupImage.day3.picture)
            }
            model.groupImage.day2.picture = nil
            model.groupImage.day1.picture = nil
            model.groupImage.night2.picture = nil
            model.groupImage.night3.picture = nil
            model.groupImage.night1.picture = nil
            day2.clear()
            day1.clear()
            night1.clear()
            night2.clear()
            night3.clear()
            break
        case .Ninght1:
            for p in productModels {
                typeIndex = Int(p.catalogType)
                chooseProduct(imageView: night1, image: p.groupImage.night1.picture)
            }
            model.groupImage.day2.picture = nil
            model.groupImage.day3.picture = nil
            model.groupImage.night2.picture = nil
            model.groupImage.night3.picture = nil
            model.groupImage.day1.picture = nil
            day2.clear()
            day3.clear()
            day1.clear()
            night2.clear()
            night3.clear()
            break

        case .Ninght2:
            for p in productModels {
                typeIndex = Int(p.catalogType)
                chooseProduct(imageView: night2, image: p.groupImage.night2.picture)
            }
            model.groupImage.day2.picture = nil
            model.groupImage.day3.picture = nil
            model.groupImage.day1.picture = nil
            model.groupImage.night3.picture = nil
            model.groupImage.night1.picture = nil
            day2.clear()
            day3.clear()
            night1.clear()
            day1.clear()
            night3.clear()
            break
        case .Ninght3:
            for p in productModels {
                typeIndex = Int(p.catalogType)
                chooseProduct(imageView: night3, image: p.groupImage.night3.picture)
            }
            model.groupImage.day2.picture = nil
            model.groupImage.day3.picture = nil
            model.groupImage.night2.picture = nil
            model.groupImage.day1.picture = nil
            model.groupImage.night1.picture = nil
            day2.clear()
            day3.clear()
            night1.clear()
            night2.clear()
            day1.clear()
            break
        default:
            break
            
        }
        
    }
    deinit {
        print("定制厨房界面销毁了")
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if size.width > size.height {
            layoutHor()
        }else{
            layoutVer()
        }
    }
    
    func layoutHor() {
        isVer = false
        productBtn.setTitle("产\n品", for: .normal)
        materialBtn.setTitle("材\n质", for: .normal)
        layout.scrollDirection = .vertical
        scrollView.contentSize = CGSize(width: (UIScreen.height) * 3, height: UIScreen.main.bounds.size.width)
        scrollView.contentOffset = CGPoint(x: UIScreen.height, y: 0)
        scrollView.snp.remakeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.height.equalTo(UIScreen.width)
            make.width.equalTo(UIScreen.height)
        }
        day1.snp.remakeConstraints { (make) in
            make.left.equalTo(0)
            make.top.equalTo(0)
            make.height.equalTo(UIScreen.width)
            make.width.equalTo(scrollView)
        }
        collectionView.snp.remakeConstraints { (make) in
            make.top.bottom.equalTo(0)
            make.right.equalTo(-45)
            make.width.equalTo(165)
        }
        
        switchView.snp.remakeConstraints { (make) in
            make.right.equalTo(view).offset(-300)
            make.top.equalTo(20)
            make.height.equalTo(120)
            make.width.equalTo(40)
        }
        productBtn.snp.remakeConstraints { (make) in
            make.left.equalTo(5)
            make.top.equalTo(5)
            make.height.equalTo(55)
            make.width.equalTo(30)
        }
        materialBtn.snp.remakeConstraints { (make) in
            make.left.equalTo(5)
            make.top.equalTo(productBtn.snp.bottom).offset(0)
            make.height.equalTo(55)
            make.width.equalTo(30)
        }
        popBtn.snp.remakeConstraints { (make) in
            make.left.equalTo(view).offset(0)
            make.top.equalTo(0)
            make.height.equalTo(85)
            make.width.equalTo(60)
        }
        dayNightBtn.snp.remakeConstraints { (make) in
            make.right.equalTo(view).offset(-290)
            make.top.equalTo(UIScreen.width - 70)
            make.width.height.equalTo(70)
        }
        pushBtn.snp.remakeConstraints { (make) in
            make.top.equalTo(UIScreen.main.bounds.size.width / 2 - 25)
            make.right.equalTo(0)
            make.height.equalTo(50)
            make.width.equalTo(25)
        }
        sliderView1.snp.remakeConstraints { (make) in
            make.top.bottom.equalTo(0)
            make.right.equalTo(-209)
            make.width.equalTo(44)
        }
        backgroundView.snp.remakeConstraints { (make) in
            make.top.bottom.right.equalTo(0)
            make.width.equalTo(253)
        }
        pushBtn.setImage(#imageLiteral(resourceName: "btn_showPlan_landscape"), for: .normal)
        sliderView1.isHidden = false
        sliderView.isHidden = true
        if typeIndex1 == 10{
            sliderView1.isHidden = true
        }

    }
    func layoutVer(){
        isVer = true
        backgroundView.isHidden = false
        let height = UIScreen.height > UIScreen.width ? UIScreen.height : UIScreen.width
        let width = UIScreen.height < UIScreen.width ? UIScreen.height : UIScreen.width
        productBtn.setTitle("产品", for: .normal)
        materialBtn.setTitle("材质", for: .normal)
        sliderView1.isHidden = true
        sliderView.isHidden = false
        if typeIndex1 == 10{
            sliderView1.isHidden = true
        }
        layout.scrollDirection = .horizontal
        scrollView.contentSize = CGSize(width: height * 3, height: width)
        scrollView.contentOffset = CGPoint(x: scrollView.contentSize.width / 3, y: 0)
        scrollView.snp.remakeConstraints { (make) in
            make.left.equalTo(-spac)
            make.width.equalTo(height)
            make.height.equalTo(height - 254)
            make.top.equalTo(0)
        }
        
        
        sliderView.snp.remakeConstraints { (make) in
            make.left.right.equalTo(0)
            make.bottom.equalTo(collectionView.snp.top).offset(0)
            make.height.equalTo(44)
        }
        collectionView.snp.remakeConstraints { (make) in
            make.left.right.equalTo(0)
            make.bottom.equalTo(-45)
            make.height.equalTo(165)
        }
        switchView.snp.remakeConstraints { (make) in
            make.left.equalTo(view).offset(25)
            make.bottom.equalTo(day2).offset(-15)
            make.height.equalTo(40)
            make.width.equalTo(120)
        }
        productBtn.snp.remakeConstraints { (make) in
            make.left.equalTo(5)
            make.top.equalTo(5)
            make.height.equalTo(30)
            make.width.equalTo(55)
        }
        materialBtn.snp.remakeConstraints { (make) in
            make.left.equalTo(productBtn.snp.right).offset(0)
            make.top.equalTo(5)
            make.height.equalTo(30)
            make.width.equalTo(55)
        }
        dayNightBtn.snp.remakeConstraints { (make) in
            make.right.equalTo(view).offset(0)
            make.bottom.equalTo(day2).offset(0)
            make.width.height.equalTo(70)
        }
        backgroundView.snp.remakeConstraints { (make) in
            make.bottom.left.right.equalTo(0)
            make.height.equalTo(254)
        }
        pushBtn.setImage(#imageLiteral(resourceName: "btn_showPlan_portrait"), for: .normal)
        pushBtn.snp.remakeConstraints { (make) in
            make.left.equalTo(width / 2 - 25)
            make.bottom.equalTo(0)
            make.height.equalTo(25)
            make.width.equalTo(50)
        }
    }
    //全屏
    func fullScreen(){
        if !isVer{
            backgroundView.isHidden = !backgroundView.isHidden
            if backgroundView.isHidden {
                switchView.snp.remakeConstraints { (make) in
                    make.right.equalTo(view).offset(-30)
                    make.top.equalTo(20)
                    make.height.equalTo(120)
                    make.width.equalTo(40)
                }
                dayNightBtn.snp.remakeConstraints { (make) in
                    make.right.equalTo(view).offset(-29)
                    make.top.equalTo(UIScreen.height - 70)
                    make.width.height.equalTo(70)
                }
            }else{
                switchView.snp.remakeConstraints { (make) in
                    make.right.equalTo(view).offset(-300)
                    make.top.equalTo(20)
                    make.height.equalTo(120)
                    make.width.equalTo(40)
                }
                dayNightBtn.snp.remakeConstraints { (make) in
                    make.right.equalTo(view).offset(-290)
                    make.top.equalTo(UIScreen.height - 70)
                    make.width.height.equalTo(70)
                }
            }
        }
    }
    //截图
    func graphics(bgView:UIView) ->UIImage{
        UIGraphicsBeginImageContextWithOptions(bgView.frame.size, false, UIScreen.main.scale)
        bgView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
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
extension FTInteractionDetailViewController:UICollectionViewDelegate, UICollectionViewDataSource, FTHorOptionsViewDeleage,UIScrollViewDelegate,FTInterOptionViewDeleage,UICollectionViewDelegateFlowLayout{
    func clickBtnAction(index: Int32) {
        chooseType(index:index)
    }

    func clickBtnActionOption(index: Int) {
        chooseType(index:Int32(index + 1))
    }


    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView == self.scrollView {
            if self.scrollView.contentOffset.x == 0 {
                if !dayNightBtn.isSelected {
                    type = .Day1
                }else{
                    type = .Ninght1
                }
                collectionView.reloadData()
            }
            if self.scrollView.contentOffset.x == scrollView.contentSize.width / 3 {
                if !dayNightBtn.isSelected {
                    type = .Day2
                }else{
                    type = .Ninght2
                }
                collectionView.reloadData()
            }
            if self.scrollView.contentOffset.x ==  scrollView.contentSize.width / 3 * 2 {
                if !dayNightBtn.isSelected {
                    type = .Day3
                }else{
                    type = .Ninght3
                }
                collectionView.reloadData()
            }
        }
        MobClick.event("JiaoDu", attributes: ["type":type])
        selectedProduct()
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:FTInteractionDetailCollectionViewCell =  collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! FTInteractionDetailCollectionViewCell
        if typeIndex1 == 10{
            cell.loadMaterial(model: viewModel.materialS[indexPath.row], type: type)
        }else{
            cell.loadModel(model: viewModel.cellViewModels[indexPath.row], type: type)
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if typeIndex1 == 10{
            return viewModel.materialS.count
        }
        return viewModel.cellViewModels.count
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if typeIndex1 == 10{
            let grounp = viewModel.materialS[indexPath.row].groupImage
            guard let groupImage = grounp else {
                return
            }
            day1.backImageView.image = groupImage.day1.picture
            day2.backImageView.image = groupImage.day2.picture
            day3.backImageView.image = groupImage.day3.picture
            night1.backImageView.image = groupImage.night1.picture
            night2.backImageView.image = groupImage.night2.picture
            night3.backImageView.image = groupImage.night3.picture
            MobClick.event("SelectedMaterial", attributes: ["material":viewModel.materialS[indexPath.row].name])
            return
        }
        let product = viewModel.cellViewModels[indexPath.row]
        typeIndex = Int(product.catalogType)
        if productModels.count != 0 {
            for model in productModels{
                if model.catalogType == product.catalogType{
                    _ = productModels.remove(model)
                }
            }
                productModels.append(product)
        }else{
            productModels.append(product)
        }
        MobClick.event("SelectedProduct", attributes: ["product":product.modelNumber])
        selectedProduct()
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if typeIndex1 == 10{
            return  CGSize(width: 150, height:200)
        }
        return  CGSize(width: 115, height:165)
    }

}
