//
//  FTLoginViewModel.swift
//  Fotile
//
//  Created by 郭金涛 on 2017/6/3.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit    

class FTLoginViewModel: NSObject {
    func login(username:String, password:String, finish:@escaping (Int)->Void) {
        let api:FTLoginApi = FTLoginApi<FTLoginModel>(username: username, password: password)
        api.requestJSON { (model) in
            if model != nil {
                if model?.code == 200{
                    UserDefaults.UserData.token.store(value: model?.data.token)
                    guard let data = model?.data else{
                        return
                    }
                    FTUserManager.userManager.saveUserWithInfo(model: data)
                }
                finish((model?.code)!)
            }
        }
    }
}
