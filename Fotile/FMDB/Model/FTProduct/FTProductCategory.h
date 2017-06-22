//
//  FTProductCategory.h
//  FoliteDB
//
//  Created by Chausson on 2017/6/22.
//  Copyright © 2017年 Chausson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FTProduct.h"
@interface FTProductCategory : NSObject
@property (nonatomic ,assign) int type;
@property (nonatomic ,copy) NSString *typeName;
@property (nonatomic ,strong) NSArray <FTProduct *>*products;
@end
