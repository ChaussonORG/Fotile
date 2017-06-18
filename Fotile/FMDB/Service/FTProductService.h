//
//  FTProductService.h
//  FoliteDB
//
//  Created by Chausson on 2017/6/18.
//  Copyright © 2017年 Chausson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FTProduct.h"
@interface FTProductService : NSObject
+ (NSArray <FTProduct *>*)fetchProductsWithRealKitchenId:(NSString *)identifier;
+ (FTProduct *)fetchProductWithId:(NSString *)identifier;
@end
