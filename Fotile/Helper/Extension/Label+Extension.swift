//
//  Label+Extension.swift
//  Lebao
//
//  Created by 黑眼圈 on 2017/4/19.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit

extension UILabel {

    
    
    /// 设置字体大小和颜色
    public func setupFontAndColor(propertyClosure:(UIFont,Color)) {
        
        font = propertyClosure.0
        textColor = propertyClosure.1
    }


}

