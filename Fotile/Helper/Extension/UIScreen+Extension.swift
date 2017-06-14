//
//  UIScreen+Extension.swift
//  eGarage
//
//  Created by 陈克锋 on 2017/3/8.
//
//

import UIKit

extension UIScreen {
    
    /// 屏幕宽度
    static var width: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    /// 屏幕高度
    static var height: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    /// 宽度是iPhone5宽度
    static var isIPhone5: Bool {
        return Int(width) == 320
    }
    
    /// 宽度是iPhone6宽度
    static var isIPhone6: Bool {
        return Int(width) == 375
    }
    
    /// 宽度是iPhone6P宽度
    static var isIPhone6P: Bool {
        return Int(width) == 414
    }
    
}
