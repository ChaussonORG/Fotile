//
//  FTGuideController.swift
//  Fotile
//
//  Created by Chausson on 2017/11/10.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit

class FTGuideController: UIViewController {
    @IBOutlet var selectButtons: [FTSelectButton]!
    @IBOutlet weak var housesView: UIView!
    let dis = DisposeBag()
    let progressView:FTGuideProgressView  = FTGuideProgressView()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUI()
        progressView.continueBtn.addTarget(self, action: #selector(nextSetp), for: .touchUpInside)
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.backBarItem(dis) {[weak self] in
               (UIApplication.shared.delegate as! AppDelegate).ftView?.isHidden = false
            _ = self?.navigationController?.popViewController(animated: true)
        }
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)


    }
    func loadUI() {
        let titleLabel:UILabel = UILabel()
        titleLabel.text = "热水器智能导购"
        //        labe.font = UIFont(name:"PingFang-SC-Bold", size: 17)
        //        labe.textColor = UIColor(realRed: 77, green: 77, blue: 77)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
        titleLabel.frame = CGRect.init(x: 0, y: 0, width: 100, height: 20)
        titleLabel.textAlignment = .center
        navigationItem.titleView = titleLabel
        
    
        
        self.view.addSubview(progressView)
        layoutUI()
        
    }
    func layoutUI() {
        progressView.snp.makeConstraints { (make) in
            make.right.left.bottom.equalTo(0)
            make.height.equalTo(130)
        }
    }
    func nextSetp(sender:UIButton){
        for btn in selectButtons {
            if btn.isSelected {
                waterHeater.house = btn.titleLabel?.text
            }
        }
        
        self.performSegue(withIdentifier: "Water", sender: self)
    }
    @IBAction func selectType(_ sender: FTSelectButton) {
        for btn in selectButtons {
            if btn != sender{
                btn.isSelected = false
            }
        }
        sender.isSelected = !sender.isSelected
        
    }
    
    
    @IBAction func pop(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        (UIApplication.shared.delegate as! AppDelegate).ftView?.isHidden = false
    }

}


