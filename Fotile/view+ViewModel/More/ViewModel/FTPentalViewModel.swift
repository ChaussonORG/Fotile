//
//  FTPentalViewModel.swift
//  Fotile
//
//  Created by 郭金涛 on 2017/6/24.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit

class FTPentalViewModel: NSObject {
    var models:Array<UIImage> = Array<UIImage>()
    func getData(type:Int){
        models.removeAll()
        if type == 0{
            for i in 1..<373{
                let image:UIImage = UIImage(named: "XZL-\(i)")!
                models.append(image)
            }
        }
        if type == 1{
            for i in 1..<192{
                let image:UIImage = UIImage(named: "MZL-\(i)")!
                models.append(image)
            }
        }
        if type == 2{
            for i in 1..<69{
                let image:UIImage = UIImage(named: "XDZL-\(i)")!
                models.append(image)
            }
        }
        if type == 3{
            for i in 1..<30{
                let image:UIImage = UIImage(named: "ZXZL-\(i)")!
                models.append(image)
            }
        }
        if type == 4{
            for i in 1..<20{
                let image:UIImage = UIImage(named: "KXZL-\(i)")!
                models.append(image)
            }
        }
        if type == 5{
            for i in 1..<26{
                let image:UIImage = UIImage(named: "WBZL-\(i)")!
                models.append(image)
            }
        }
        if type == 6{
            for i in 1..<4{
                let image:UIImage = UIImage(named: "XWZL-\(i)")!
                models.append(image)
            }
        }
        if type == 7{
            for i in 1..<50{
                let image:UIImage = UIImage(named: "RZL-\(i)")!
                models.append(image)
            }
        }
        
    }
}
