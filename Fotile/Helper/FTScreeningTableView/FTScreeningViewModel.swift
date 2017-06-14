//
//  FTScreeningViewModel.swift
//  Fotile
//
//  Created by 郭金涛 on 2017/5/23.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit

class FTScreeningViewModel: NSObject {
    override init() {
        super.init()
        fetchData()
    }
    var array = ["油烟机","灶具","消毒柜","蒸微一体机","蒸箱","烤箱","微波炉","水槽洗碗机", "热水器"]
    var array1 = ["ERWER","123WD","QERIR","12WQE","WE_12","11123","D--W3","12-WE", "02-1E"]
    var array2 = ["ERWER","123WD","QERIR","12WQE"]

    
    var costArray = ["1万以下","1万-2万","2万-4万","4万以上"]
    var areaArray = ["20平米以下","20-50平米","50平米以上"]

    
    var cellViewModels = Array<FTScreeningCellViewModel>()
    var areaCellViewModels = Array<FTScreeningCellViewModelAreaAndCost>()
    var costCellViewModels = Array<FTScreeningCellViewModelAreaAndCost>()

    func fetchData() {
        for i in 0..<array.count {
            let model = FTScreeningCellViewModel()
            model.title = array[i]
            if i == 1 {
                for j in 0..<array2.count {
                    let item = FTScreeningCellViewModelItem()
                    item.title = array2[j]
                    model.items.append(item)
                }
            }else{
                for j in 0..<array1.count {
                    let item = FTScreeningCellViewModelItem()
                    item.title = array1[j]
                    model.items.append(item)
                    
                }
            }
            cellViewModels.append(model)
        }
        for i in 0..<areaArray.count {
            let model = FTScreeningCellViewModelAreaAndCost()
            model.title = areaArray[i]
            areaCellViewModels.append(model)
        }
        for i in 0..<costArray.count {
            let model = FTScreeningCellViewModelAreaAndCost()
            model.title = costArray[i]
            costCellViewModels.append(model)
        }
    }
    class func getHeight(number:Int) -> CGFloat{
        if number % 5 == 0{
            return CGFloat(30 + (number / 5 - 1) * 70)
        }
        return CGFloat(30 + number / 5 * 70)
    }
}
class FTScreeningCellViewModelAreaAndCost: NSObject {
    var title:String = ""
    var isSelected:Bool = false
}
class FTScreeningCellViewModel: NSObject {
    var title:String = ""
    var height:CGFloat = 30
    var isOpen:Bool = false
    var items = Array<FTScreeningCellViewModelItem>()
}
class FTScreeningCellViewModelItem: NSObject {
    var isSelected:Bool = false
    var title:String = ""
}
