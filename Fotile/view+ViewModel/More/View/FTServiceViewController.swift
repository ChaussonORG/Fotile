//
//  FTServiceViewController.swift
//  Fotile
//
//  Created by 郭金涛 on 2017/6/1.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit

class FTServiceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let labe:UILabel = UILabel()
        labe.text = "服务项目与收费"
        labe.font = UIFont.boldSystemFont(ofSize: 17)
        labe.frame = CGRect.init(x: 0, y: 0, width: 100, height: 20)
        labe.textAlignment = .center
        navigationItem.titleView = labe
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
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
