//
//  FTMoreViewController.swift
//  Fotile
//
//  Created by 郭金涛 on 2017/4/25.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit
import CHProgressHUD
class FTMoreViewController: UIViewController {
    var isShow:Bool = false
    let viewModel:FTMoreViewModel = FTMoreViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        loadui()
        // Do any additional setup after loading the view.
    }
    lazy var downLoad:FTDownloadView = {
        let view = FTDownloadView.share()
        return view
    }()
    func loadui(){
        whiteView.addSubview(dowloadLabel)
        whiteView.addSubview(dowloadBtn)
        whiteView.addSubview(logoutBtn)
        whiteView.addSubview(line)
        whiteView.addSubview(line1)
        UIApplication.shared.keyWindow?.addSubview(blackView)
        UIApplication.shared.keyWindow?.addSubview(whiteView)
        let tap = UITapGestureRecognizer(target: self, action: #selector(hide))
        blackView.addGestureRecognizer(tap)
        dowloadBtn.snp.makeConstraints { (make) in
            make.right.equalTo(-50)
            make.top.equalTo(0)
            make.width.equalTo(300)
            make.height.equalTo(115)
        }
    }
    func show() {
    
        blackView.isHidden = false
        isShow = !isShow
        UIView.animate(withDuration: 0) {
            self.whiteView.frame = CGRect(x: 0, y: 64, width: UIScreen.width, height: 230)
        }
        if haveUpdata && dbUrl.length != 0{
            dowloadBtn.setTitle("开始更新", for: .normal)
            dowloadBtn.setTitleColor(FTStyleConfiguration.red, for: .normal)
            dowloadBtn.isEnabled = true
            return
        }
        viewModel.fetchData(time: FTUserManager.userManager.getTime()) { (data) in
            self.haveUpdata = data.haveUpdate
            self.dbUrl = data.dbUrl
            self.lastUpdateTime = data.lastUpdateTime
            if data.haveUpdate {
                self.dowloadBtn.setTitle("开始更新", for: .normal)
                self.dowloadBtn.isEnabled = true
            }else{
                self.dowloadBtn.setTitle("暂无更新", for: .normal)
                self.dowloadBtn.setTitleColor(FTStyleConfiguration.lightGray, for: .normal)
                self.dowloadBtn.isEnabled = false
            }
        }
    }
    func hide(){
      
        blackView.isHidden = true
        isShow = !isShow
        UIView.animate(withDuration: 0) {
            self.whiteView.frame = CGRect(x: 0, y: -230, width: UIScreen.width, height: 0)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func setAction(_ sender: Any) {
        if !isShow {
            show()
        }else{
            hide()
        }
    }
    lazy var blackView:UIView = {
        let view:UIView = UIView()
        view.backgroundColor = UIColor.black
        view.frame = CGRect.init(x: 0, y: 64, width: UIScreen.width, height: UIScreen.height)
        view.isHidden = true
        view.alpha = 0.4
        return view
    }()
    lazy var line:UIView = {
        let view:UIView = UIView(frame: CGRect.init(x: 50, y: 115, width: UIScreen.width - 100, height: 1))
        view.backgroundColor = FTStyleConfiguration.line
        return view
    }()
    lazy var line1:UIView = {
        let view:UIView = UIView(frame: CGRect.init(x: 0, y: 0, width: UIScreen.width, height: 1))
        view.backgroundColor = FTStyleConfiguration.line
        return view
    }()
    lazy var whiteView:UIView = {
        let view:UIView = UIView(frame: CGRect.init(x: 0, y: -230, width: UIScreen.width, height: 0))
        view.backgroundColor = UIColor.white
        return view
    }()
    lazy var dowloadLabel:UILabel = {
        let label:UILabel = UILabel()
        label.textColor = UIColor.black
        label.text = "离线下载"
        label.frame = CGRect.init(x: 50, y: 0, width: 100, height: 115)
        label.font = FTStyleConfiguration.font17bold
        return label
    }()
    
    lazy var dowloadBtn:UIButton = {
        let btn:UIButton = UIButton()
        btn.contentHorizontalAlignment = .right
        btn.setTitleColor(FTStyleConfiguration.red, for: .normal)
        btn.titleLabel?.font = FTStyleConfiguration.font16
        btn.addTarget(self, action: #selector(checkAction), for: .touchUpInside)
        return btn
    }()
    lazy var logoutBtn:UIButton = {
        let btn:UIButton = UIButton()
        btn.setTitle("退出账号", for: .normal)
        btn.contentHorizontalAlignment = .left
        btn.frame = CGRect.init(x: 50, y: 115, width: UIScreen.width - 100, height: 115)
        btn.addTarget(self, action: #selector(logout), for: .touchUpInside)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.titleLabel?.font = FTStyleConfiguration.font17bold
        return btn
    }()
    var haveUpdata:Bool = false
    var dbUrl:String = ""
    var lastUpdateTime:String = ""
    func checkAction(){
        CHProgressHUD.show(true)
        if haveUpdata && dbUrl.length != 0{
            FTDataOperation.shareInstance().downDataBase(withUrl: dbUrl, completion: { [weak self](bool) in
                CHProgressHUD.hide(true)
                if bool{
                    guard let weakSelf = self else{
                        return
                    }
                    weakSelf.downLoad.show()
                    weakSelf.hide()
                    weakSelf.downLoad.againBtn.isHidden = true
                    weakSelf.downLoad.message.textColor = FTStyleConfiguration.black
                    FTImageManager.shareInstance().downloadAllImages({ (number, all) in
                        weakSelf.downLoad.number.text = String(number * 100 / all)
                        if number == all{
                            FTUserManager.userManager.saveTime(time: weakSelf.lastUpdateTime)
                            weakSelf.haveUpdata = false
                            weakSelf.dowloadBtn.isEnabled = false
                            weakSelf.downLoad.hide()
                            let api:FTUploadFinishApi = FTUploadFinishApi<FTCommenModel>()
                            api.requestJSON({ (model) in
                                
                            })
                            
                        }
                    }, failureBlock: { [weak self] in
                        guard let weakSelf = self else{
                            return
                        }
                        weakSelf.downLoad.againBtn.isHidden = false
                        weakSelf.downLoad.againDownloadBlock = {
                            weakSelf.checkAction()
                        }
                    })
                }else{
                    CHProgressHUD.showPlainText("数据库文件下载失败")
                }
            })
            return
        }else{
            CHProgressHUD.showPlainText("请求数据库地址失败")
        }
    }
    func getTime() -> String{
        let date = Date()
        let timeInterval:TimeInterval = date.timeIntervalSince1970 * 1000
        let timeStamp = Int(timeInterval)
        return "\(timeStamp)"
    }
    func logout()  {
        hide()
        let vc:UIAlertController = UIAlertController(title: "提示", message: "是否确认退出登录", preferredStyle: .alert)
        let acton1:UIAlertAction = UIAlertAction(title: "取消", style: .cancel) { (alerttion) in
            
        }
        let acton2:UIAlertAction = UIAlertAction(title: "确定", style: .default) { (alerttion) in
            UserDefaults.UserData.token.store(value: "")
            (UIApplication.shared.delegate as! AppDelegate).logOut()

        }
        vc.add([acton1,acton2])
        self.present(vc, animated: true) { 
            
        }

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       // navigationController?.isNavigationBarHidden = true
        (UIApplication.shared.delegate as! AppDelegate).ftView?.isHidden = false
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
