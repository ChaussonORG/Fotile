//
//  FTUploadFinishApi.swift
//  Fotile
//
//  Created by 郭金涛 on 2017/7/31.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit
class FTUploadFinishApi<T:HandyJSON>: CHHandyRequestable{
    typealias R = T

    var path: String {
        return "/api/update/echo"
    }
    var method: HTTPMethod {
        return .post
    }
    var encoding: ParameterEncoding {
        return JSONEncoding.default
    }
//    func parameters() -> [String : Any] {
//        return ["timeStamp":timeStr]
//    }
}
