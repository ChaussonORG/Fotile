//
//  APIInfo.swift
//  eGGHelper
//
//  Created by 郭金涛 on 2017/3/2.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit
let config = Config()
struct Config:CHRequestAdapter {
    
}
extension CHRequestAdapter {
    var baseURL:String{
        //        return "http://kitchenapp.fotile.com"
        return "http://tomcat.ngrok.curvesoft.net"
    }
    var httpHeaderFields:[String :String]{
        return ["X-Fotile-Token":FTUserManager.userManager.getModel().token]
    }
    var commonParameters:[String :Any]{
        return [:]
    }
}

