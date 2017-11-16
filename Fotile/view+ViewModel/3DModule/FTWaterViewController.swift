//
//  FTWaterViewController.swift
//  Fotile
//
//  Created by Chausson on 2017/11/13.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit

class FTWaterViewController: UIViewController {
    let progressView:FTGuideProgressView  = FTGuideProgressView()
    let pictures:Array<String> = ["icon_tap_1","icon_tap_2","icon_tap_3","icon_tap_4","icon_tap_5"]
    let contents:Array<String> = ["  厨房龙头","  洗面池龙头","  其他龙头","  手持式花洒","  顶喷式花洒"]
    
    @IBOutlet weak var collectView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUI()
        progressView.continueBtn.addTarget(self, action: #selector(nextSetp), for: .touchUpInside)
    }

    func loadUI() {
        self.view.addSubview(progressView)
        progressView.selectStage(1)
        progressView.snp.makeConstraints { (make) in
            make.right.left.bottom.equalTo(0)
            make.height.equalTo(130)
        }
    }
    func nextSetp(sender:UIButton){
        let cells:Array<FTWaterCell> = collectView.visibleCells as! Array<FTWaterCell>
        var count = 0
        for cell in cells{
            if cell.content.isSelected {
                count = count+1
            }
            
        }
        waterHeater.waterCount = count

        if waterHeater.waterCount == 0 {
            return
        }
        self.performSegue(withIdentifier: "Feature", sender: self)
    }
    
    
}
extension FTWaterViewController:UICollectionViewDataSource{
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return 5
    }
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell:FTWaterCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Water", for: indexPath) as! FTWaterCell
        cell.picture.image = UIImage(named: pictures[indexPath.row])
        cell.content.setTitle(contents[indexPath.row], for: .normal)

        return cell
    }
        
}

class FTWaterCell:UICollectionViewCell{
    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var content: UIButton!
    @IBAction func action(_ sender: UIButton) {
        content.isSelected = !sender.isSelected
    }
    
}
