//
//  UserDefaultSettable.swift
//  UserDefaultSettable
//
//  Created by 黑眼圈 on 2017/3/23.
//  Copyright © 2017年 heiyan. All rights reserved.
//
//
//  --- 偏好设置工具类(UserDefaults)
//      -- 限制只能存储字符串(String类型)


import UIKit

public protocol UserDefaultSettable {
    var uniqueKey: String { get }
}

public extension UserDefaultSettable where Self: RawRepresentable, Self.RawValue == String {
    
    /// 存偏好设置(存)
    public func store(value: Any?){
        UserDefaults.standard.set(value, forKey: uniqueKey)
        UserDefaults.standard.synchronize() 
    }
    
    /// 从偏好设置取数据(取)
    public var storedValue: String? {
        return value as? String
    }
    
    /// 从偏好设置删除对象(删)
    public func removed() {
        UserDefaults.standard.removeObject(forKey: uniqueKey)
    }
    
    private var value: Any? {
        return UserDefaults.standard.value(forKey: uniqueKey)
    }
    
    /// 以类与属性拼接为命名空间,防止重复命名key
    public var uniqueKey: String {
        return "\(Self.self).\(rawValue)"
    }
    
}



// MARK: - 添加需要储存的字段(根据业务)
extension UserDefaults {

    //用户信息
    enum UserData: String,UserDefaultSettable {
        case city
        case token
        case id
        case cityId
        case lastLogin
        case name
        case outlet
        case type
        case tusernameype
        case timeString
    }
}

// MARK: - 数据转换
extension UserDefaults {
    
    /// 数组或字典转换成json字符串
    func anyChangeToJson(info: Any) -> String{
        //首先判断能不能转换
        guard JSONSerialization.isValidJSONObject(info) else {
            debugPrint("json转换失败")
            return ""
        }
        //如果设置options为JSONSerialization.WritingOptions.prettyPrinted，则打印格式更好阅读
        let jsonData = try? JSONSerialization.data(withJSONObject: info, options: [])
        if let jsonData = jsonData {
            let str = String(data: jsonData, encoding: String.Encoding.utf8)
            return str ?? ""
        }else {
            return ""
        }
    }
    
    
    /// json字符串转换成数组或字典
    func jsonChangeToAny(infoJson: String) -> Any {
        
        let jsonData = infoJson.data(using: String.Encoding.utf8, allowLossyConversion: true)
        
        if let jsonData = jsonData {
            let obj = try? JSONSerialization.jsonObject(with: jsonData, options: [])
            return obj ?? ""
        }else {
            return ""
        }
    }
    
    
    

}





