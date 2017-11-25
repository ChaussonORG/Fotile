//
//  FT3DModuleController.swift
//  Fotile
//
//  Created by Chausson on 2017/11/10.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit
class FT3DModuleController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "热水器智能导购"
        // Do any additional setup after loading the view.
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        (UIApplication.shared.delegate as! AppDelegate).ftView?.isHidden = false

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
