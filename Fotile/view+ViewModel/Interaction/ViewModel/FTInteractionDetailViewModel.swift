//
//  FTInteractionDetailViewModel.swift
//  Fotile
//
//  Created by 郭金涛 on 2017/5/15.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit

class FTInteractionDetailViewModel: NSObject {
    var cellViewModels = Array<FTProduct>()
    var materialS = Array<FTMaterial>()
    var isDefultProduct:Bool = false
    override init() {
        super.init()
    }

}
