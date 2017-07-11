//
//  FTCheckUploadModel.swift
//  Fotile
//
//  Created by 郭金涛 on 2017/6/18.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit

struct FTCheckUploadModel: HandyJSON {
    var code:Int = 0
    var currentElements:String = ""
    var message:String = ""
    var data:FTCheckUploadModelData = FTCheckUploadModelData()
}
struct FTCheckUploadModelData: HandyJSON {
    var dbUrl:String = ""
    var lastUpdateTime:String = ""
    var haveUpdate:Bool = true
}
