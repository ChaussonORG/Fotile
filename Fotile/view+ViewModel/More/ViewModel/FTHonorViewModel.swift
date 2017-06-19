//
//  FTPentalViewModel.swift
//  Fotile
//
//  Created by 郭金涛 on 2017/6/19.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit

class FTHonorViewModel: NSObject {
    var honors = Array<UIImage>()
    func get(year:String) {
        honors.removeAll()
        var count = 0
        switch year {
        case "2005":
            count = 38
        case "2006":
            count = 50
        case "2007":
            count = 24
        case "2008":
            count = 22
        case "2009":
            count = 26
        case "2010":
            count = 41
        case "2011":
            count = 38
        case "2012":
            count = 30
        case "2013":
            count = 24
        case "2014":
            count = 20
        case "2015":
            count = 47
        case "2016":
            count = 13
        default:
            break
        }
        for i in 1..<count{
            let image = UIImage(named: "Z\(year)-\(i)")
            honors.append(image!)
        }
    }
}
