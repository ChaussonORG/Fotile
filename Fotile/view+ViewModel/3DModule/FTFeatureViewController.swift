//
//  FTFeatureViewController.swift
//  Fotile
//
//  Created by Chausson on 2017/11/13.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit

class FTFeatureViewController: UIViewController {
    @IBOutlet weak var mainTableView: UITableView!
    let progressView:FTGuideProgressView  = FTGuideProgressView()
    let disposeBag:DisposeBag = DisposeBag()
    let pictures:Array<String> = ["icon_func_1","icon_func_2","icon_func_3"]
    let titles:Array<String> = ["恒定水温","WIFI互联","净化水质"]
    let contents:Array<String> = ["防止忽冷忽热","危险情况推送手机报警","有效过滤水中铁锈,余氧"]
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUI()
        progressView.continueBtn.addTarget(self, action: #selector(nextSetp), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }

    func loadUI() {
        self.view.addSubview(progressView)

        progressView.selectStage(2)
        progressView.snp.makeConstraints { (make) in
            make.right.left.bottom.equalTo(0)
            make.height.equalTo(130)
        }
    }
    func nextSetp(sender:UIButton){
        let cells = mainTableView.visibleCells
        for cell in cells {
            let action:UIButton = cell.viewWithTag(4) as! UIButton
            if action.isSelected{
                self.performSegue(withIdentifier: "City", sender: self)
                return
            }
        }
    }
    

}
extension FTFeatureViewController:UITableViewDataSource,UITableViewDelegate{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "feature")
        let picture:UIImageView = cell?.viewWithTag(1) as! UIImageView
        let title:UILabel = cell?.viewWithTag(2) as! UILabel
        let content:UILabel = cell?.viewWithTag(3) as! UILabel
        let action:UIButton = cell?.viewWithTag(4) as! UIButton
        action.rx.tap.subscribe {  [weak self] event in
            self?.selectedRow(tableView, didSelectRowAt: indexPath)
        }.addDisposableTo(disposeBag)
        picture.image = UIImage(named: pictures[indexPath.row])
        title.text = titles[indexPath.row]
        content.text = contents[indexPath.row]
   
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedRow(tableView, didSelectRowAt: indexPath)
    }
      func selectedRow(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        let action:UIButton = cell?.viewWithTag(4) as! UIButton
        let title:UILabel = cell?.viewWithTag(2) as! UILabel
        let content:UILabel = cell?.viewWithTag(3) as! UILabel
        action.isSelected = !action.isSelected
        if action.isSelected {
            title.textColor = RedColor
            content.textColor = RedColor
        }else{
            title.textColor = LightGrayColor
            content.textColor = LightGrayColor
        }
        switch indexPath.row {
        case 0:
            waterHeater.temperature = action.isSelected
        case 1:
            waterHeater.wifi = action.isSelected
        case 2:
            waterHeater.quality = action.isSelected
        default:
            waterHeater.temperature = false
        }
    }
 
}
