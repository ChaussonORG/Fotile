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
    func getSceneryData(id:String)  {
       let models =  FTProductService.fetchProducts(withRealKitchenId: id)
        guard let array = models else {
            return
        }
        for  product in array {
            let cellViewModel:FTProductCellViewModel = FTProductCellViewModel()
            cellViewModel.imageUrl = product.thumnailImage.picture
            cellViewModel.name = product.name
            cellViewModel.modelNumber = product.modelNumber
            cellViewModel.slogan = product.slogan
            cellViewModel.parameters = product.parameters
            for parm in product.parms {
                cellViewModel.params.append(parm)
            }
            cellViewModels.append(cellViewModel)
        }
    }
}

class FTProductCellViewModel: NSObject {
    var isOpen:Bool = false
    var imageUrl:UIImage = UIImage()
    var name:String = ""
    var modelNumber:String = ""
    var slogan:String = ""
    var parameters:String = ""
    var params:Array<FTProductParm> = [FTProductParm]()
}
