//
//  UIImageView+Extension.swift
//  辣妈圈
//
//  Created by 黑眼圈 on 2017/4/12.
//  Copyright © 2017年 heiyan. All rights reserved.
//

import UIKit





extension UIImageView {
    
    /// 切圆
    ///
    /// - Parameter size: 大小
    func cutRounded(size:CGSize) {
        let maskPath = UIBezierPath(roundedRect: CGRect.init(origin: CGPoint(), size: size), byRoundingCorners: .allCorners, cornerRadii: size)
        let maskLayer = CAShapeLayer()
        maskLayer.frame = CGRect.init(origin: CGPoint(), size: size)
        maskLayer.path = maskPath.cgPath
        
        self.layer.mask = maskLayer;
    }
    
    func kfSetImage(url:NSURL ,placeholder:UIImage? ,progressClosure:@escaping (_ progress:CGFloat)->() ,imageClosure:@escaping (_ image:UIImage ,_ error:NSError?)->()) {
        
        self.kf.setImage(with: ImageResource.init(downloadURL: url as URL), placeholder: placeholder, options:[], progressBlock: { (receivedSize, totalSize) in
            
            progressClosure(CGFloat.init(receivedSize)/CGFloat.init(totalSize))
            
        }) { (image, error, _, _) in
            
            imageClosure(image ?? UIImage() ,error)
        }
    }
  
    
  
    
}
