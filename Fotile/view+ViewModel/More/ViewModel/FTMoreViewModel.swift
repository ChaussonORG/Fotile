//
//  FTMoreViewModel.swift
//  Fotile
//
//  Created by 郭金涛 on 2017/6/18.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit
import CHProgressHUD
class FTMoreViewModel: NSObject {
    func fetchData(time:String, finish:@escaping (FTCheckUploadModelData)->Void){
        let api = FTCheckUploadApi<FTCheckUploadModel>(timeStr: time)
        api.requestJSON { (m) in
            if m != nil{
                guard let model = m else{
                    return
                }
                if model.code == 200{
                    
                }else{
                    CHProgressHUD.showPlainText(model.message)
                }
                finish(model.data)

            }
        }
    }
}
