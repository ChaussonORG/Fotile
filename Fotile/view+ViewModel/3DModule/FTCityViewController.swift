//
//  FTCityViewController.swift
//  Fotile
//
//  Created by Chausson on 2017/11/13.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit

class FTCityViewController: UIViewController {
    let progressView:FTGuideProgressView  = FTGuideProgressView()

    @IBOutlet var cities: [FTSelectButton]!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUI()
        progressView.continueBtn.addTarget(self, action: #selector(nextSetp), for: .touchUpInside)
        for city in cities {
            city.addTarget(self, action: #selector(didSelected), for:.touchUpInside)
        }
        // Do any additional setup after loading the view.
    }

    func loadUI() {
        self.view.addSubview(progressView)
        progressView.continueBtn.setTitle("完成", for: .normal)
        progressView.selectStage(3)
        progressView.snp.makeConstraints { (make) in
            make.right.left.bottom.equalTo(0)
            make.height.equalTo(130)
        }
    }
    func nextSetp(sender:UIButton){
        self.performSegue(withIdentifier: "Result", sender: self)
    }
    func didSelected(sender:UIButton) {
        for city in cities {
            city.isSelected = false
        }
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            waterHeater.city = sender.titleLabel?.text
        }
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
