//
//  FTCustomKCService.h
//  FoliteDB
//
//  Created by Chausson on 2017/6/6.
//  Copyright © 2017年 Chausson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FTCustomKitchen.h"
#import "FTCustomKTDetail.h"
@interface FTCustomKCService : NSObject
// 获取定制厨房列表
+ (NSArray<FTCustomKitchen *> *)fetchCustomKitchenList;
// 根据id获取定制厨房详情
+ (FTCustomKTDetail *)fetchCustomDetailWithId:(NSString *)identifer;
// Obj获取定制厨房详情

+ (FTCustomKTDetail *)fetchCustomDetail:(FTCustomKitchen *)custom;
@end
