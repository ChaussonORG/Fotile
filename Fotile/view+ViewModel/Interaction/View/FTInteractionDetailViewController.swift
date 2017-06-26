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

    @IBOutlet var popBtn: UIButton!
    var type:kitType = .Day2
    var typeIndex = 1
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
        view.addSubview(collectionView)
        view.addSubview(sliderView)
        view.addSubview(scrollView)
        scrollView.addSubview(night1)
        scrollView.addSubview(night3)
        scrollView.addSubview(night2)
        
        scrollView.addSubview(day1)
        scrollView.addSubview(day3)
        scrollView.addSubview(day2)
        scrollView.addSubview(ninghtView)
        
        scrollView.addSubview(popBtn)
        scrollView.addSubview(dayNightBtn)
        scrollView.addSubview(switchView)
        switchView.addSubview(productBtn)
        switchView.addSubview(materialBtn)
        day2.backImageView.image = model.groupImage.day2.picture
        day1.backImageView.image = model.groupImage.day1.picture
        day3.backImageView.image = model.groupImage.day3.picture
        night1.backImageView.image = model.groupImage.night1.picture
        night2.backImageView.image = model.groupImage.night2.picture
        night3.backImageView.image = model.groupImage.night3.picture

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
        layout.itemSize = CGSize(width: 115, height: 165)
        layout.minimumInteritemSpacing = 25
        return layout
    }()
    
    lazy var sliderView:FTHorOptionsView = {
        let view:FTHorOptionsView = FTHorOptionsView(frame: .zero)
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

        return btn
    }()
    func productAction() {
        productBtn.isSelected = true
        materialBtn.isSelected = false
        productBtn.backgroundColor = UIColor.black
        materialBtn.backgroundColor = UIColor.white
        sliderView.isHidden = false
        self.chooseType(index: 1)
        collectionView.reloadData()
    }
    func materialAction() {
        materialBtn.isSelected = true
        productBtn.isSelected = false
        materialBtn.backgroundColor = UIColor.black
        productBtn.backgroundColor = UIColor.white
        sliderView.isHidden = true
        self.chooseType(index: 10)
        collectionView.reloadData()
    }
    @IBAction func popAction(_ sender: Any) {
        navigationController?.popViewController(animated: false)
    }

    @IBAction func pushAction(_ sender: Any) {
        CHProgressHUD.show(true)
        let vc = FTSchemeViewController()
        vc.productModels = self.productModels
        vc.array.append(self.graphics(bgView: day1))
        vc.array.append(self.graphics(bgView: day2))
        vc.array.append(self.graphics(bgView: day3))
        vc.array.append(self.graphics(bgView: night1))
        vc.array.append(self.graphics(bgView: night2))
        vc.array.append(self.graphics(bgView: night3))
        self.present(vc, animated: true) {
            CHProgressHUD.hide(true)
        }
    }
    
    lazy var ninghtView:UIView = {
        let view:UIView = UIView()
        view.backgroundColor = UIColor.black
        view.alpha = 0.4
        view.isHidden = true
        return view
    }()
    @IBAction func dayNightAction(_ sender: Any) {
        dayNightBtn.isSelected = !dayNightBtn.isSelected
        if dayNightBtn.isSelected {
            day1.isHidden = true
            day2.isHidden = true
            day3.isHidden = true
            night3.isHidden = false
            night1.isHidden = false
            night2.isHidden = false
            if self.scrollView.contentOffset.x == 0 {
                type = .Ninght1
            }
            if self.scrollView.contentOffset.x == UIScreen.height {
                type = .Ninght2
            }
            if self.scrollView.contentOffset.x == UIScreen.height * 2 {
                type = .Ninght3
            }
            collectionView.reloadData()
        }else{
            day1.isHidden = false
            day2.isHidden = false
            day3.isHidden = false
            night3.isHidden = true
            night1.isHidden = true
            night2.isHidden = true
            if self.scrollView.contentOffset.x == 0 {
                type = .Day1
            }
            if self.scrollView.contentOffset.x == UIScreen.height {
                type = .Day2
            }
            if self.scrollView.contentOffset.x == UIScreen.height * 2 {
                type = .Day3
            }
            collectionView.reloadData()

        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        (UIApplication.shared.delegate as! AppDelegate).isAllow = true
    }

    func chooseType(index:Int32)  {
       
        if index == 10{
            viewModel.materialS.removeAll()
            for model in model.materials {
                viewModel.materialS.append(model)
            }
        }else{
             viewModel.cellViewModels.removeAll()
            for model in model.products {
                if  model.catalogType == index{
                    viewModel.cellViewModels.append(model)
                }
            }
        }

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
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if size.width > size.height {
            layoutHor()
        }else{
            layoutVer()
        }
    }
    
    func layoutHor() {
        layout.scrollDirection = .vertical
        scrollView.contentSize = CGSize(width: (UIScreen.height - 254) * 3, height: UIScreen.main.bounds.size.width)
        scrollView.contentOffset = CGPoint(x: UIScreen.width, y: 0)
        scrollView.snp.remakeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.height.equalTo(UIScreen.width)
            make.width.equalTo(UIScreen.height - 254)
        }
        day1.snp.remakeConstraints { (make) in
            make.left.equalTo(0)
            make.top.equalTo(0)
            make.height.equalTo(UIScreen.width)
            make.width.equalTo(scrollView)
        }
        sliderView.snp.remakeConstraints { (make) in
            make.top.bottom.equalTo(0)
            make.width.equalTo(44)
            make.right.equalTo(collectionView.snp.left).offset(0)
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
            make.left.equalTo(productBtn.snp.right).offset(0)
            make.top.equalTo(5)
            make.height.equalTo(55)
            make.width.equalTo(30)
        }
        popBtn.snp.remakeConstraints { (make) in
            make.left.equalTo(view).offset(0)
            make.top.equalTo(0)
            make.height.equalTo(85)
            make.width.equalTo(60)
        }
        
    }
    func layoutVer(){
        layout.scrollDirection = .horizontal
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.size.width * 3, height: UIScreen.main.bounds.size.height)
        scrollView.contentOffset = CGPoint(x: scrollView.contentSize.width / 3, y: 0)
        scrollView.snp.remakeConstraints { (make) in
            make.left.equalTo(-spac)
            make.width.equalTo(UIScreen.main.bounds.size.width)
            make.height.equalTo(UIScreen.width - 254)
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
extension FTInteractionDetailViewController:UICollectionViewDelegate, UICollectionViewDataSource, FTHorOptionsViewDeleage,UIScrollViewDelegate{
    func clickBtnAction(index: Int32) {
      chooseType(index: index)
        
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
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:FTInteractionDetailCollectionViewCell =  collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! FTInteractionDetailCollectionViewCell
        if typeIndex == 10{
            cell.loadMaterial(model: viewModel.materialS[indexPath.row], type: type)
        }else{
            cell.loadModel(model: viewModel.cellViewModels[indexPath.row], type: type)
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if typeIndex == 10{
            return viewModel.materialS.count
        }
        return viewModel.cellViewModels.count
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if typeIndex == 10{
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
            return
        }
        chooseProduct(imageView: day1, image: viewModel.cellViewModels[indexPath.row].groupImage.day1.picture)
        chooseProduct(imageView: day2, image: viewModel.cellViewModels[indexPath.row].groupImage.day2.picture)
        chooseProduct(imageView: day3, image: viewModel.cellViewModels[indexPath.row].groupImage.day3.picture)
        chooseProduct(imageView: night1, image: viewModel.cellViewModels[indexPath.row].groupImage.night1.picture)
        chooseProduct(imageView: night2, image: viewModel.cellViewModels[indexPath.row].groupImage.night2.picture)
        chooseProduct(imageView: night3, image: viewModel.cellViewModels[indexPath.row].groupImage.night3.picture)
        if productModels.count != 0 {
            for model in productModels{
                if model.catalogType == viewModel.cellViewModels[indexPath.row].catalogType{
                    //isSame = true
                    _ = productModels.remove(model)
                }
            }
          //  if isSame {
                productModels.append(viewModel.cellViewModels[indexPath.row])
          //  }
        }else{
            productModels.append(viewModel.cellViewModels[indexPath.row])
        }
        
    }

}
