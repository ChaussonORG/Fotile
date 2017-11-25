//
//  FT3DModuleViewModel.swift
//  Fotile
//
//  Created by Chausson on 2017/11/13.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import Foundation
let waterHeater:FT3DModuleViewModel = FT3DModuleViewModel()
class FT3DModuleViewModel: NSObject {
    var viewModel = FTProductViewModel()
    var cellViewModels = Array<FTProductCellViewModel>()
    var city:String?
    var house:String?
    var temperature:Bool = false
    var wifi:Bool = false
    var quality:Bool = false
    var list:[FTProduct] = Array()
    var waterCount:Int = 0 {
        didSet{
            if waterCount >= 3{
                waterCount = 3
            }
        }
    }
    func finish() {
        filterProudct()
    }
    func filterProudct() {
        let path = Bundle.main.path(forResource: "3DModule", ofType: "plist")
        guard let p = path else {
            return
        }
        list.removeAll()
        cellViewModels.removeAll()
        viewModel.products.removeAll()
        let filter:NSArray =  NSArray(contentsOfFile: p)!
        for  dic in filter {
            
            let model = WaterModel.deserialize(from: dic as! NSDictionary)
            if (model?.wifi)! == wifi && model?.temperature == temperature && model?.quality == quality && (model?.waterCount)! >= waterCount && isMatch(cities: (model?.cities)!) && isMatch(houses: (model?.houses)!){
                let product = FTProductService.fetchProduct(withNumber: model?.number)
                if product != nil{
                    list.append(product!)
                }
            }
        }
        for  p in list {
            let vm = getCellVieModel(product: p)
            cellViewModels.append(vm)
        }
        viewModel.cellViewModels = cellViewModels
        let model:FTProductCategory = FTProductCategory()
        model.type = 9
        model.typeName = "热水器"
        for product in list {
            model.products.append(getCellVieModel(product: product))
        }
        viewModel.products.append(model)
    
    }
    private func isMatch(cities:Array<String>) ->Bool{
        var isMatch = false
        for name in cities{
            if name == city{
                isMatch = true
                break
            }
        }
        return isMatch
        
    }
    private func isMatch(houses:Array<String>) -> Bool {
        var isMatch = false
        for name in houses{
            if name == house{
                isMatch = true
                break
            }
        }
        return isMatch
    }
}
class WaterModel:HandyJSON{
    var houses:Array<String>?
    var waterCount:Int = 0
    var cities:Array<String>?
    var quality:Bool = false
    var wifi:Bool = false
    var temperature:Bool = false
    var number:String?
    required init() {}
}
