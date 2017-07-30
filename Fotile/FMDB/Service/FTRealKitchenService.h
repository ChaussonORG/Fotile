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
// 根据城市获取实景厨房推荐列表 ，城市必传

+ (NSArray <FTRealKitchenList*>*)fetchTopRealKitchensWithCityId:(NSString *)identifier;
// 根据城市获取实景厨房列表

+ (NSArray <FTRealKitchenList*>*)fetchRealKitchensWithCityId:(NSString *)identifier;
+ (NSArray <FTRealKitchenList*>*)fetchRealKitchensWithCityId:(NSString *)identifier
                                                estateName:(NSString *)name;

+ (NSArray <FTRealKitchenList*>*)fetchRealKitchensWithCityId:(NSString *)identifier
                                                 productNumber:(NSString *)number
                                                   kitchenArea:(NSString *)area
                                                    fotileCost:(NSString *)cost
                                                   betweenCost:(NSString *)price;

@end
