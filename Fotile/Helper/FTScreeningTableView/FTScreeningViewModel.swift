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
    var array1 = ["CXW-358-Z3T-M","CXW-358-Z1T-M","CXW-200-EM03T","CXW-200-EM10T","CXW-200-EM11T","CXW-200-EM12T","CXW-200-JQ01TS","CXW-200-JQ03TS", "CXW-200-JQ08TS-Y","CXW-200-JQ08TS-F","CXW-200-JQ08TS-L","CXW-200-JQ08TS-H","CXW-200-EM7TS","CXW-200-EM10TS"]
    var array2 = ["JZY/T-JA6B","JZY/T- HA6B","JZY/T-TA1B","JZY/T/R-JA1G","JZY/T/R-JA6G","JZY/T/R-JACB","JZY/T-JA1GB.Z","JZY/T/R-HA6G","CS34BW"]
    var array3 = ["ZTD100J-12","ZTD100J-13","ZTD100J-J25","ZTD100F-WH2","ZTD100F-WH5","ZTD100F-Z1","ZTD100F-H08-Y","ZTD100F-H08-F","ZTD100F-H08-L","ZTD100S-KM6","ZTD100S-KM7"]
    var array4 = ["ZW-Z1","ZW-C2S","ZW-D1"]
    var array5 = ["SCD39-Z1","SCD26-C2S","SCD26-D1"]
    var array6 = ["KQD60F-Z1","KQD50F-C2SG","KQD50F-D1G"]
    var array7 = ["W25800SH-Z1","W25800P-C2S","W20800P-D1"]
    var array8 = ["JBSD3T-Q7","JBSD3T-Q6","JBSD2F-Q5","JBSD2T-Q3", "JBSD2T-Q2","JBSD2T-Q1"]
    var array9 = ["JSQ31-1509S","JSQ31-1510SW","JSQ31-1402","JSQ31-H16M7"]

    var costArray = ["1万以下","1万-2万","2万-4万","4万以上"]
    var areaArray = ["5-7平米","8-10平米","10平米以上"]

    
    var cellViewModels = Array<FTScreeningCellViewModel>()
    var areaCellViewModels = Array<FTScreeningCellViewModelAreaAndCost>()
    var costCellViewModels = Array<FTScreeningCellViewModelAreaAndCost>()

    func fetchData() {
        for i in 1..<(array.count + 1){
            let model = FTScreeningCellViewModel()
            model.title = array[i - 1]
            if i == 1 {
                for j in 0..<array1.count {
                    let item = FTScreeningCellViewModelItem()
                    item.title = array1[j]
                    model.items.append(item)
                }
            }
            if i == 2 {
                for j in 0..<array2.count {
                    let item = FTScreeningCellViewModelItem()
                    item.title = array2[j]
                    model.items.append(item)
                }
            }
            if i == 3 {
                for j in 0..<array3.count {
                    let item = FTScreeningCellViewModelItem()
                    item.title = array3[j]
                    model.items.append(item)
                }
            }
            if i == 4 {
                for j in 0..<array4.count {
                    let item = FTScreeningCellViewModelItem()
                    item.title = array4[j]
                    model.items.append(item)
                }
            }
            if i == 5 {
                for j in 0..<array5.count {
                    let item = FTScreeningCellViewModelItem()
                    item.title = array5[j]
                    model.items.append(item)
                }
            }
            if i == 6 {
                for j in 0..<array6.count {
                    let item = FTScreeningCellViewModelItem()
                    item.title = array6[j]
                    model.items.append(item)
                }
            }
            if i == 7 {
                for j in 0..<array7.count {
                    let item = FTScreeningCellViewModelItem()
                    item.title = array7[j]
                    model.items.append(item)
                }
            }
            if i == 8 {
                for j in 0..<array8.count {
                    let item = FTScreeningCellViewModelItem()
                    item.title = array8[j]
                    model.items.append(item)
                }
            }
            if i == 9 {
                for j in 0..<array9.count {
                    let item = FTScreeningCellViewModelItem()
                    item.title = array9[j]
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
