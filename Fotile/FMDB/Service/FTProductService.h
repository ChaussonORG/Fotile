//
//  FTProductService.h
//  FoliteDB
//
//  Created by Chausson on 2017/6/18.
//  Copyright © 2017年 Chausson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FTProductCategory.h"
#import "FTProductHL.h"
#import "FTProductSeries.h"
@interface FTProductService : NSObject
+ (FTProduct *)fetchProductWithId:(NSString *)identifier;
+ (NSArray <FTProduct *>*)fetchProductsWithRealKitchenId:(NSString *)identifier;
+ (NSArray <FTProduct *>*)fetchProductWithType:(int )type;
+ (NSArray <FTProduct *>*)fetchProductWithModelNumber:(NSString *)number;
+ (FTProduct *)fetchProductWithNumber:(NSString *)number;

+ (NSArray <FTProductCategory *>*)fetchCategoryWithModelNumber:(NSString *)number;

+ (NSArray <FTProductCategory *>*)fetchAllProductCategory;
+ (NSArray <FTProductHL *>*)fetchHeightLightWithId:(NSString *)identifier; // 获取产品亮点图
+ (FTImage *)fetchInstallImageWithId:(NSString *)identifier; // 获取安装示意图
+ (FTProductSeries *)fetchSeriesWithId:(NSString *)identifier; // 获取套系
+ (NSArray <FTProduct *>*)fetchOthersProductWithId:(NSString *)identifier; // 获取搭配建议
+ (NSArray <FTProduct *>*)fetchMoreProductWithId:(NSString *)identifier; // 获取更多型号

@end
