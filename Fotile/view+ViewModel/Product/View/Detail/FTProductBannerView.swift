//
//  FTProductBannerView.swift
//  Fotile
//
//  Created by Chausson on 2017/6/26.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit

class FTProductBannerView: UIView {
    let scrollView:UIScrollView = UIScrollView()
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    init(frame:CGRect,images:Array<FTImage>) {
        let width = frame.size.width
    
        super.init(frame: frame)
        addSubview(scrollView)
//        scrollView.isPagingEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.snp.makeConstraints { (make) in
            make.left.equalTo(50)
            make.top.equalTo(0)
            make.right.equalTo(-50)
            make.bottom.equalTo(0)
        }
        if images.count > 0 {
            for index in 0...images.count-1 {
                let x = CGFloat(index)*(width+20)

                let view = UIView(frame: CGRect(x: x, y: 0, width: width+20, height: frame.size.height))
                let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: frame.size.height))
                imageView.clipsToBounds = true 
                view.addSubview(imageView)
                imageView.image = images[index].picture
                scrollView.addSubview(view)
                if index == images.count - 1 {
                    let contentWidth = view.frame.origin.x+view.frame.size.width
                    scrollView.contentSize = CGSize(width:contentWidth, height: 0)
                    
                }
                
                
            }
        }
      
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
