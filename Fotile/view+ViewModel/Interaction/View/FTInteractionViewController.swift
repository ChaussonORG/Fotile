//
//  FTInteractionViewController.swift
//  Fotile
//
//  Created by 郭金涛 on 2017/4/25.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit

class FTInteractionViewController: UIViewController {
    var distance:CGFloat = 0
    @IBOutlet var tableView: UITableView!
    var models = Array<FTCustomKitchen>()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = .bottom
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        view.backgroundColor = UIColor.white
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        models = FTCustomKCService.fetchCustomKitchenList()
        tableView.reloadData()
        (UIApplication.shared.delegate as! AppDelegate).ftView?.isHidden = false
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
    }
}
extension FTInteractionViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:FTInteractionTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! FTInteractionTableViewCell
        
        cell.loadModel(model: models[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 292
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = FTInteractionDetailViewController()
        let rectTable = tableView.rectForRow(at: indexPath)
        let rect = tableView.convert(rectTable, to: tableView.superview)
        vc.rect = rect
        let model = models[indexPath.row]
        vc.model = FTCustomKCService.fetchCustomDetail(model)
        navigationController?.pushViewController(vc, animated: false)
        MobClick.event("CustomKitchen", attributes: ["name":model.name])

       // navigationController?.wxs_pushViewController(vc, animationType: .brickOpenVertical)
    }
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        for c in tableView.visibleCells {
//            print(scrollView.contentOffset.y)
//            let cell:FTInteractionTableViewCell = c as! FTInteractionTableViewCell
////            if scrollView.contentOffset.y - distance >= 100 && scrollView.contentOffset.y - distance > 0{
////                return
////            }
//            if scrollView.contentOffset.y + 100 > 200{
//                //return
//            }
//            cell.imageV.snp.updateConstraints({ (make) in
//                make.top.equalTo(-(scrollView.contentOffset.y + 100))
//            })
//        }
//        
//    }
//    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//        distance = scrollView.contentOffset.y
//
//    }
}
extension UIViewController {
    class func currentViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return currentViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            return currentViewController(base: tab.selectedViewController)
        }
        if let presented = base?.presentedViewController {
            return currentViewController(base: presented)
        }
        return base
    }
    
}

