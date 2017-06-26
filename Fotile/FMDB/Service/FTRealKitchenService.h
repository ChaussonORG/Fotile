//
//  FTRealKitchenService.h
//  FoliteDB
//
//  Created by Chausson on 2017/6/14.
//  Copyright © 2017年 Chausson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FTRealKitchen.h"
#import "FTRealKitchenList.h"
@interface FTRealKitchenService : NSObject
// 获取实景厨房列表
+ (NSArray<FTRealKitchen *> *)fetchRealKitchens;
// 根据城市获取实景厨房列表
+ (NSArray <FTRealKitchenList*>*)fetchRealKitchensWithCity:(NSString *)name;

+ (NSArray <FTRealKitchenList*>*)fetchRealKitchensWithCityName:(NSString *)name
                                              productNumber:(NSString *)number
                                                kitchenArea:(NSString *)area
                                                 fotileCost:(NSString *)cost;

@end
