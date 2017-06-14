//
//  UITextField+Extension.swift
//  Lebao
//
//  Created by 黑眼圈 on 2017/4/20.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit

extension UITextField {
    
    
    //限制字数(需要实时监听这个方法)
    public func astrictTextLength(maxLength:Int) {
        let text = self.text ?? ""
        let selectedRange:UITextRange? = self.markedTextRange
        if selectedRange == nil {
            if text.length > maxLength {
                let textIndex = text.index(text.startIndex, offsetBy: maxLength)
                self.text = text.substring(to: textIndex)
            }
        }
    }
    
    
}
