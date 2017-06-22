//
//  FTProductService.h
//  FoliteDB
//
//  Created by Chausson on 2017/6/18.
//  Copyright © 2017年 Chausson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FTProductCategory.h"

@interface FTProductService : NSObject
+ (FTProduct *)fetchProductWithId:(NSString *)identifier;
+ (NSArray <FTProduct *>*)fetchProductsWithRealKitchenId:(NSString *)identifier;
+ (NSArray <FTProduct *>*)fetchProductWithModelNumber:(NSString *)number;

+ (NSArray <FTProductCategory *>*)fetchAllProductCategory;


@end
