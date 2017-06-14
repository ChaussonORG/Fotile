//
//  HLUserManager.swift
//  huolijuzhen
//
//  Created by 郭金涛 on 16/11/30.
//  Copyright © 2016年 Gjt. All rights reserved.
//

import UIKit

class FTUserManager: NSObject {


    static let message:String = "网络请求失败"
    static let userManager = FTUserManager()
    lazy var currentUser:FTLoginModelData = {
        let   currentUser = FTLoginModelData()
        return currentUser
    }()
    func saveUserWithInfo(model:FTLoginModelData) {
        UserDefaults.UserData.token.store(value: model.token)
        //***只能存入字符串类型,其他无效***
        UserDefaults.UserData.id.store(value: model.userInfo.id)
        UserDefaults.UserData.city.store(value: "\(model.userInfo.city)")
        UserDefaults.UserData.lastLogin.store(value: "\(model.userInfo.lastLogin)")
        UserDefaults.UserData.name.store(value: model.userInfo.name)
        UserDefaults.UserData.outlet.store(value: model.userInfo.outlet)
        UserDefaults.UserData.type.store(value: model.userInfo.type)
        UserDefaults.UserData.tusernameype.store(value: model.userInfo.tusernameype)
    }
    func isLogin() -> Bool {
        if let token:String = UserDefaults.UserData.token.storedValue{
            if  token.length != 0 {
                return true
            }else{
                return false
            }
        }
        return false
    }
    func getModel() -> FTLoginModelData{

        if let id = UserDefaults.UserData.id.storedValue {
            currentUser.userInfo.id = id
        }
        if let city = UserDefaults.UserData.city.storedValue {
            currentUser.userInfo.city = city
        }
        if let lastLogin = UserDefaults.UserData.lastLogin.storedValue {
            currentUser.userInfo.lastLogin = lastLogin
        }
        if let name = UserDefaults.UserData.name.storedValue {
            currentUser.userInfo.name = name
        }
        if let outlet = UserDefaults.UserData.outlet.storedValue {
            currentUser.userInfo.outlet = outlet
        }
        if let type = UserDefaults.UserData.type.storedValue {
            currentUser.userInfo.type = type
        }
        if let tusernameype = UserDefaults.UserData.tusernameype.storedValue {
            currentUser.userInfo.tusernameype = tusernameype
        }
        if let token = UserDefaults.UserData.token.storedValue {
            currentUser.token = token
        }
        return currentUser
    }
    
    class func coverIconVague(icon:String) -> String{
        let str = (icon as NSString).substring(to: icon.length - 10)
        return str
        
    }
}
