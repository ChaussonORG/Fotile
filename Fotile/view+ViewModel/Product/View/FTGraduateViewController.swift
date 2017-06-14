
//
//  FTGraduateViewController.swift
//  Fotile
//
//  Created by 郭金涛 on 2017/5/21.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit

class FTGraduateViewController: UIViewController {
    class func news() -> FTGraduateViewController {
        let story = UIStoryboard.init(name: "Product", bundle: nil)
        let vc = story.instantiateViewController(withIdentifier: "graduatevc")
        return vc as! FTGraduateViewController
    }

    @IBAction func backAction(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    @IBOutlet var btn1: UIButton!
    @IBOutlet var line1: UIView!
    @IBOutlet var line2: UIView!
    @IBOutlet var btn2: UIButton!
    @IBOutlet var lin3: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.tabBarController?.title = "123123"
        //navigationController?.title = "lldllll"
        //tabBarController?.navigationController?.title = "123123"
        // Do any additional setup after loading the view.
    }
    @IBOutlet var btn3: UIButton!

    @IBOutlet var imageView1: UIImageView!
    @IBAction func action1(_ sender: Any) {
        btn1.isSelected = true
        btn2.isSelected = false
        btn3.isSelected = false
        line1.isHidden = false
        line2.isHidden = true
        lin3.isHidden = true
        imageView1.image = #imageLiteral(resourceName: "home2")
    }
    @IBAction func action2(_ sender: Any) {
        btn1.isSelected = false
        btn2.isSelected = true
        btn3.isSelected = false
        line1.isHidden = true
        line2.isHidden = false
        lin3.isHidden = true
        imageView1.image = #imageLiteral(resourceName: "home3")
    }
    @IBAction func action3(_ sender: Any) {
        btn1.isSelected = false
        btn2.isSelected = false
        btn3.isSelected = true
        line1.isHidden = true
        line2.isHidden = true
        lin3.isHidden = false
        imageView1.image = #imageLiteral(resourceName: "timg2")

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
