//
//  FTProductViewModel.swift
//  Fotile
//
//  Created by 郭金涛 on 2017/5/10.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit

class FTProductViewModel: NSObject {
    var cellViewModels = Array<FTProductCellViewModel>()
    func getData()  {
        for i in 0..<10{
            let model = FTProductCellViewModel()
            model.imageUrl = "product\(i + 1)"
            if i > 2 {
                model.imageUrl = "product1"
            }
            cellViewModels.append(model)
        }
    }
}

class FTProductCellViewModel: NSObject {
    var isOpen:Bool = false
    var imageUrl:String = ""
}
