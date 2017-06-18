//
//  FTCheckUploadApi.swift
//  Fotile
//
//  Created by 郭金涛 on 2017/6/18.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit

class FTCheckUploadApi<T:HandyJSON>: CHHandyRequestable{
    typealias R = T
    var timeStr:String
    
    init(timeStr:String) {
        self.timeStr = timeStr
    }
    var path: String {
        return "/api/update/checkUpdate"
    }
    var method: HTTPMethod {
        return .post
    }
    var encoding: ParameterEncoding {
        return JSONEncoding.default
    }
    func parameters() -> [String : Any] {
        return ["timeStamp":timeStr]
    }
}
