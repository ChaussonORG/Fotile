//
//  FTHonorViewController.swift
//  Fotile
//
//  Created by 郭金涛 on 2017/6/1.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit

class FTHonorViewController: UIViewController {
    let viewModel:FTHonorViewModel = FTHonorViewModel()

    @IBOutlet var btn1: UIButton!
    @IBOutlet var btn2: UIButton!
    @IBOutlet var line1: UIView!
    @IBOutlet var line2: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        MobClick.event("Honor")

        loadui()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    func loadui(){
        viewModel.get(year: "2016")
        viewModel.getMedal(year: "2016")
        let labe:UILabel = UILabel()
        labe.text = "企业荣誉"
        labe.font = UIFont.boldSystemFont(ofSize: 17)
        labe.frame = CGRect.init(x: 0, y: 0, width: 100, height: 20)
        labe.textAlignment = .center
        navigationItem.titleView = labe
        view.addSubview(collectionView2)
        view.addSubview(collectionView1)
        view.addSubview(optionsTableView)
        collectionView1.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.top.equalTo(44)
            make.right.equalTo(-44)
            make.bottom.equalTo(0)
        }
        collectionView2.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.top.equalTo(44)
            make.right.equalTo(-44)
            make.bottom.equalTo(0)
        }
        optionsTableView.snp.makeConstraints { (make) in
            make.right.equalTo(0)
            make.top.equalTo(44)
            make.left.equalTo(collectionView2.snp.right).offset(0)
            make.bottom.equalTo(0)
        }
        optionsTableView.didseleIndex = { year in
            self.viewModel.get(year: year)
            self.viewModel.getMedal(year: year)
            self.collectionView1.reloadData()
            self.collectionView2.reloadData()
        }
    }
    @IBAction func action1(_ sender: Any) {
        btn1.isSelected = true
        btn2.isSelected = false
        line1.isHidden = false
        line2.isHidden = true
        view.bringSubview(toFront: collectionView1)
    }
    @IBAction func action2(_ sender: Any) {
        btn1.isSelected = false
        btn2.isSelected = true
        line1.isHidden = true
        line2.isHidden = false
        view.bringSubview(toFront: collectionView2)
    }
    lazy var optionsTableView:FTYearsOptionsTableView = {
        let view:FTYearsOptionsTableView = FTYearsOptionsTableView(frame: CGRect.zero, style: .plain)
        return view
    }()
    lazy var collectionView1:UICollectionView = {
        let  layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsetsMake(25, 25, 0, 25)
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.size.width - 114) / 3, height:(UIScreen.main.bounds.size.width - 114) / 3)
        let collectionView:UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.collectionViewLayout = layout
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(FTHonorCollectionViewCell.self, forCellWithReuseIdentifier: "cellId1")
        return collectionView
    }()
    lazy var collectionView2:UICollectionView = {
        let  layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsetsMake(25, 25, 0, 25)
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.size.width - 114) / 3, height:(UIScreen.main.bounds.size.width - 114) / 3)
        let collectionView:UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.collectionViewLayout = layout
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(FTHonorCollectionViewCell.self, forCellWithReuseIdentifier: "cellId2")
        return collectionView
    }()
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
extension FTHonorViewController:UICollectionViewDelegate,UICollectionViewDataSource{

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionView1 {
            let cell:FTHonorCollectionViewCell =  collectionView.dequeueReusableCell(withReuseIdentifier: "cellId1", for: indexPath) as! FTHonorCollectionViewCell
            cell.loadModel(image: viewModel.honors[indexPath.row])
            return cell
        }
        let cell:FTHonorCollectionViewCell =  collectionView.dequeueReusableCell(withReuseIdentifier: "cellId2", for: indexPath) as! FTHonorCollectionViewCell
        cell.loadModel(image: viewModel.medals[indexPath.row])
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionView1 {
            return viewModel.honors.count
        }
        return viewModel.medals.count
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }

}
