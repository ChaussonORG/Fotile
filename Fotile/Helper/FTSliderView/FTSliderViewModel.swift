//
//  FTSliderViewModel.swift
//  Fotile
//
//  Created by 郭金涛 on 2017/5/10.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit

class FTSliderViewModel: NSObject {
    var spacInt = 20
    var cellViewModles = Array<FTSliderCellViewModel>()
    var yearsModels = Array<FTSliderCellViewModel>()

    var array = ["油烟机","灶具","消毒柜","蒸微一体机","蒸箱","烤箱","微波炉","水槽洗碗机", "热水器"]
    var years = ["2017","2016","2015","2014","2013","2012","2011","2010","2009","2008"]
    override init() {
        super.init()
        getData()
    }
    func getData() {
        var spac = [spacInt * 3,spacInt * 2,spacInt * 3,spacInt * 5,spacInt * 2,spacInt * 2,spacInt * 3,spacInt * 5 , spacInt * 3]
        for i in 0..<array.count {
            let model = FTSliderCellViewModel()
            if i == 0 {
                model.isSele = true
            }else{
                model.isSele = false
            }
            model.title = array[i]
            model.spac = CGFloat(spac[i])
            cellViewModles.append(model)
        }
        for i in 0..<years.count {
            let model = FTSliderCellViewModel()
            if i == 0 {
                model.isSele = true
            }else{
                model.isSele = false
            }
            model.title = years[i]
            yearsModels.append(model)
        }
    }
}
class FTSliderCellViewModel: NSObject {
    var isSele:Bool = false
    var title:String = ""
    var spac:CGFloat = 0
}
