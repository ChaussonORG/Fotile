//
//  CGFloat+Ectension.swift
//  Lebao
//
//  Created by 黑眼圈 on 2017/4/19.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit




extension CGFloat {
    
    
    //辣妈圈图片的大小
    public static func getCriclePhotoWidth() -> CGFloat {
        
        if UIScreen.isIPhone5 {
            return 75.0
        } else if UIScreen.isIPhone6 {
            return 85.0
        } else if UIScreen.isIPhone6P {
            return 90.0
        } else {
            return 85.0
        }
    }
}
