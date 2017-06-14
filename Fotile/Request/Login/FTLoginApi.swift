//
//  FTLoginApi.swift
//  Fotile
//
//  Created by 郭金涛 on 2017/6/3.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit
class FTLoginApi<T:HandyJSON>: CHHandyRequestable{
    typealias R = T
    var username:String
    var password:String
    
    init(username:String,password:String) {
        self.username = username
        self.password = password
    }
    var path: String {
        return "/api/login"
    }
    var method: HTTPMethod {
        return .post
    }
    var encoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    func parameters() -> [String : Any] {
        return ["username":username,
                "password":password]
    }
}
