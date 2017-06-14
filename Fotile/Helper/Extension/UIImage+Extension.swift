//
//  UIImage+Extension.swift
//  Lebao
//
//  Created by 黑眼圈 on 2017/4/18.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit

extension UIImage {
    
    /// UIColor转UIImage
    public class func colorToGenerateImages(color:UIColor) -> UIImage{
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        
        let ctx = UIGraphicsGetCurrentContext()
        
        ctx?.setFillColor(color.cgColor)
        ctx?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return image ?? UIImage()
    }
    
}
