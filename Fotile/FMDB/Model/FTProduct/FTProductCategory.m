//
//  FTProductCategory.m
//  FoliteDB
//
//  Created by Chausson on 2017/6/22.
//  Copyright © 2017年 Chausson. All rights reserved.
//

#import "FTProductCategory.h"

@implementation FTProductCategory
- (NSString *)typeName{
    switch (_type) {
        case 1:
            return @"油烟机";
            break;
        case 2:
            return @"灶具";
            break;
        case 3:
            return @"消毒柜";
            break;
        case 4:
            return @"水槽洗碗机";
            break;
        case 5:
            return @"蒸箱";
            break;
        case 6:
            return @"烤箱";
            break;
        case 7:
            return @"蒸微一体机";
            break;
        case 8:
            return @"微波炉";
            break;
            
        default:
            return @"油烟机";
            break;
    }
}
@end
