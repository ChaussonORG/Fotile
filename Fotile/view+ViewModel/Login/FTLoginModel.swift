//
//  FTLoginModel.swift
//  Fotile
//
//  Created by 郭金涛 on 2017/6/3.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit

struct FTLoginModel: HandyJSON {
    var code:Int = 0
    var currentElements:String = ""
    var data:FTLoginModelData = FTLoginModelData()
}
struct FTLoginModelData: HandyJSON {
    var token:String = ""
    var userInfo:FTUserInfor = FTUserInfor()
}
struct FTUserInfor: HandyJSON {
    var city:String = ""
    var id:String = ""
    var lastLogin:String = ""
    var name:String = ""
    var outlet:String = ""
    var type:String = ""
    var tusernameype:String = ""

}
