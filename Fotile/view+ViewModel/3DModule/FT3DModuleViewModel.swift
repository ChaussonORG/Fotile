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
    var city:String?
    var house:String?
    var temperature:Bool = false
    var wifi:Bool = false
    var quality:Bool = false
    var waterCount:Int = 0 {
        didSet{
            if waterCount >= 3{
                waterCount = 3
            }
        }
    }
    func finish() {
        
    }
}
