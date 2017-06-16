//
//  FTRealKitchenList.m
//  FoliteDB
//
//  Created by Chausson on 2017/6/15.
//  Copyright © 2017年 Chausson. All rights reserved.
//

#import "FTRealKitchenList.h"

@implementation FTRealKitchenList
- (instancetype)init
{
    self = [super init];
    if (self) {
        _list = [NSMutableArray array];
    }
    return self;
}
@end
