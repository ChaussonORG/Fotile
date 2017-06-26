//
//  FTPentalViewController.swift
//  Fotile
//
//  Created by 郭金涛 on 2017/6/1.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit

class FTPentalViewController: UIViewController {
    @IBOutlet var btn1: UIButton!
    @IBOutlet var btn2: UIButton!
    @IBOutlet var btn3: UIButton!
    @IBOutlet var line1: UIView!
    @IBOutlet var line2: UIView!
    @IBOutlet var line3: UIView!
    let viewModel:FTPentalViewModel = FTPentalViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadui()
        // Do any additional setup after loading the view.
    }
    func loadui(){
        viewModel.getData(type: 0)
        let labe:UILabel = UILabel()
        labe.text = "专利墙"
        labe.font = UIFont.boldSystemFont(ofSize: 17)
        labe.frame = CGRect.init(x: 0, y: 0, width: 100, height: 20)
        labe.textAlignment = .center
        navigationItem.titleView = labe
        view.addSubview(sliderView)
//        view.addSubview(collectionView2)
//        view.addSubview(collectionView3)
        view.addSubview(collectionView1)
        sliderView.snp.makeConstraints { (make) in
            make.right.equalTo(0)
            make.top.equalTo(0)
            make.width.equalTo(44)
            make.bottom.equalTo(0)
        }
        collectionView1.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.top.equalTo(0)
            make.right.equalTo(sliderView.snp.left).offset(0)
            make.bottom.equalTo(0)
        }
//        collectionView2.snp.makeConstraints { (make) in
//            make.left.equalTo(0)
//            make.top.equalTo(44)
//            make.right.equalTo(sliderView.snp.left).offset(0)
//            make.bottom.equalTo(0)
//        }
//        collectionView3.snp.makeConstraints { (make) in
//            make.left.equalTo(0)
//            make.top.equalTo(44)
//            make.right.equalTo(sliderView.snp.left).offset(0)
//            make.bottom.equalTo(0)
//        }
    }
    @IBAction func action1(_ sender: Any) {
        btn1.isSelected = true
        btn2.isSelected = false
        btn3.isSelected = false
        line1.isHidden = false
        line2.isHidden = true
        line3.isHidden = true
        view.bringSubview(toFront: collectionView1)
    }
    @IBAction func action2(_ sender: Any) {
        btn1.isSelected = false
        btn2.isSelected = true
        btn3.isSelected = false
        line1.isHidden = true
        line2.isHidden = false
        line3.isHidden = true
        view.bringSubview(toFront: collectionView2)
    }
    @IBAction func action3(_ sender: Any) {
        btn1.isSelected = false
        btn2.isSelected = false
        btn3.isSelected = true
        line1.isHidden = true
        line2.isHidden = true
        line3.isHidden = false
        view.bringSubview(toFront: collectionView3)
    }
    
    lazy var sliderView:FTOptionEightView = {
        let view:FTOptionEightView = FTOptionEightView(frame: CGRect.zero)
        view.deleage = self
        return view
    }()
    lazy var collectionView1:UICollectionView = {
        let  layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.sectionInset = UIEdgeInsetsMake(25, 25, 0, 25)
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.size.width - 114) / 3, height:(UIScreen.main.bounds.size.width - 114) / 3 + 40)
        let collectionView:UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.collectionViewLayout = layout
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(FTPentalCollectionViewCell.self, forCellWithReuseIdentifier: "cellId1")
        return collectionView
    }()
    lazy var collectionView2:UICollectionView = {
        let  layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.sectionInset = UIEdgeInsetsMake(25, 25, 0, 25)
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.size.width - 114) / 3, height:(UIScreen.main.bounds.size.width - 114) / 3 + 40)
        let collectionView:UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.collectionViewLayout = layout
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(FTPentalCollectionViewCell.self, forCellWithReuseIdentifier: "cellId2")
        return collectionView
    }()
    lazy var collectionView3:UICollectionView = {
        let  layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.sectionInset = UIEdgeInsetsMake(25, 25, 0, 25)
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.size.width - 114) / 3, height:(UIScreen.main.bounds.size.width - 114) / 3 + 40)
        let collectionView:UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.collectionViewLayout = layout
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(FTPentalCollectionViewCell.self, forCellWithReuseIdentifier: "cellId3")
        return collectionView
    }()
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
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
extension FTPentalViewController:FTOptionEightViewDeleage, UICollectionViewDelegate,UICollectionViewDataSource{
    func clickBtnAction(index: Int) {
        viewModel.getData(type: index)
        collectionView1.reloadData()
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      //  if collectionView == collectionView1 {
        let cell:FTPentalCollectionViewCell =  collectionView.dequeueReusableCell(withReuseIdentifier: "cellId1", for: indexPath) as! FTPentalCollectionViewCell
        cell.loadImage(image: viewModel.models[indexPath.row])
        return cell
      //  }
//        if collectionView == collectionView2 {
//            let cell:FTPentalCollectionViewCell =  collectionView.dequeueReusableCell(withReuseIdentifier: "cellId2", for: indexPath) as! FTPentalCollectionViewCell
//            return cell
//        }
//        let cell:FTPentalCollectionViewCell =  collectionView.dequeueReusableCell(withReuseIdentifier: "cellId3", for: indexPath) as! FTPentalCollectionViewCell
//        return cell
        
    
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.models.count
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
    }

    
}
