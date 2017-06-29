//
//  FTLoginViewController.swift
//  Fotile
//
//  Created by 郭金涛 on 2017/6/3.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit
import CHProgressHUD
class FTLoginViewController: UIViewController {

    @IBOutlet var loginBtn: UIButton!
    @IBOutlet var nickName: UITextField!
    @IBOutlet var password: UITextField!
    let viewModel:FTLoginViewModel = FTLoginViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        loginBtn.layer.masksToBounds = true
        loginBtn.layer.cornerRadius = 15
        loginBtn.layer.borderWidth = 1
        loginBtn.layer.borderColor = FTStyleConfiguration.line.cgColor
        nickName.addTarget(self, action: #selector(nickNameChange), for: .editingChanged)
        password.addTarget(self, action: #selector(passwordChange), for: .editingChanged)

        // Do any additional setup after loading the view.
    }
    func nickNameChange()  {
       loginChange()
    }
    func passwordChange()  {
        loginChange()
    }
    func loginChange() {
        if nickName.text?.length != 0 && password.text?.length != 0  {
            loginBtn.setTitleColor(UIColor.white, for: .normal)
            loginBtn.backgroundColor = FTStyleConfiguration.red
            loginBtn.isEnabled = true
        }else{
            loginBtn.setTitleColor(FTStyleConfiguration.b3b3b3, for: .normal)
            loginBtn.backgroundColor = UIColor.white
            loginBtn.isEnabled = false
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginAction(_ sender: Any) {
        CHProgressHUD.show(true)
        viewModel.login(username: nickName.text!, password: password.text!) { [weak self](code) in
            CHProgressHUD.hide(true)
            if code == 200{
                
                (UIApplication.shared.delegate as! AppDelegate).login()
            }else if code == -100{
                self?.loginBtn.setTitle("网络连接超时，请稍后重试", for: .normal)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                    self?.loginBtn.setTitle("登录", for: .normal)
                })
            }else{
                self?.loginBtn.setTitle("用户名或密码错误", for: .normal)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: { 
                    self?.loginBtn.setTitle("登录", for: .normal)
                })
            }
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
