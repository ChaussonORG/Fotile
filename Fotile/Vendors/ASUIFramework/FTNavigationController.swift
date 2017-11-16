//
//  LBNavigationController.swift
//  Lebao
//
//  Created by 郭金涛 on 2017/4/12.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit

class FTNavigationController: UINavigationController,UIGestureRecognizerDelegate {
    let dis:DisposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.isTranslucent = false
        let view:UIView = UIView(frame: CGRect.init(x: 0, y: 44, width: self.view.frame.size.width, height: 3))
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.black]
        self.navigationBar.addSubview(view)
//        self.interactivePopGestureRecognizer?.isEnabled = true
//        self.interactivePopGestureRecognizer?.delegate = self;
        self.hidesBottomBarWhenPushed = true
        // Do any additional setup after loading the view.
    }
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if self.viewControllers.count == 1 {
            return false
        }else{
            return true
        }
    }
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if (self.viewControllers.count > 0) {
            (UIApplication.shared.delegate as! AppDelegate).ftView?.isHidden = true
        }
        super.pushViewController(viewController, animated: animated)
        if viewController.navigationItem.leftBarButtonItem == nil && self.viewControllers.count > 1{
            viewController.navigationItem.leftBarButtonItem = self.customLeftBackButton()
            viewController.tabBarController?.tabBar.isHidden = true
            //(UIApplication.shared.delegate as! AppDelegate).tabbar?.tabBar.isHidden = true
        }
        
    }
    func customLeftBackButton() -> UIBarButtonItem{
      return  UIBarButtonItem.backBarItem(dis) {[weak self] in
           _ = self?.popViewController(animated: true)
        }
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
