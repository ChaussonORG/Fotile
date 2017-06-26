//
//  FTProductViewModel.swift
//  Fotile
//
//  Created by 郭金涛 on 2017/5/10.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit

class FTProductViewModel: NSObject {
    var imagelist = ["icon_吸油烟机","icon_嵌入式灶具","icon_嵌入式消毒柜","icon_蒸微一体机","icon_嵌入式蒸箱","icon_嵌入式烤箱","icon_嵌入式微波炉","icon_水槽洗碗机","icon_燃气热水器"]
    
    var cellViewModels = Array<FTProductCellViewModel>()
    var products = Array<FTProductCategory>()
    func getData(){
        let models = FTProductService.fetchAllProductCategory()
        guard let array = models else {
            return
        }
        for category in array{
            let model:FTProductCategory = FTProductCategory()
            model.type = Int(category.type)
            model.typeName = category.typeName
            for product in category.products {
                model.products.append(self.getCellVieModel(product: product))
            }
            products.append(model)
        }
    }
    
    func getSceneryData(id:String)  {
       let models =  FTProductService.fetchProducts(withRealKitchenId: id)
        guard let array = models else {
            return
        }
        for  product in array {
    
            cellViewModels.append(self.getCellVieModel(product: product))
        }
    }
    
    func getCellVieModel(product:FTProduct) -> FTProductCellViewModel{
        let cellViewModel:FTProductCellViewModel = FTProductCellViewModel()
        if let pic = product.thumnailImage.picture {
            cellViewModel.imageUrl = pic
        }
        cellViewModel.name = product.name
        cellViewModel.modelNumber = product.modelNumber
        cellViewModel.slogan = product.slogan
        cellViewModel.parameters = product.parameters
        cellViewModel.productId = product.identifier
        for parm in product.parms {
            cellViewModel.params.append(parm)
        }
        return cellViewModel
    }
}
class FTProductCategory: NSObject {
    var type:Int = 0
    var typeName:String = ""
    var products:Array<FTProductCellViewModel> = Array<FTProductCellViewModel>()
}

class FTProductCellViewModel: NSObject {
    var productId:String = ""
    var isOpen:Bool = false
    var imageUrl:UIImage = UIImage()
    var name:String = ""
    var modelNumber:String = ""
    var slogan:String = ""
    var parameters:String = ""
    var params:Array<FTProductParm> = [FTProductParm]()
}
