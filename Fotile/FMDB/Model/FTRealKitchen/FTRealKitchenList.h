//
//  FTRealKitchenList.h
//  FoliteDB
//
//  Created by Chausson on 2017/6/15.
//  Copyright © 2017年 Chausson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FTRealKitchen.h"
@interface FTRealKitchenList : NSObject
@property (nonatomic ,strong) NSMutableArray <FTRealKitchen *>* list;
@property (nonatomic ,copy) NSString *city;
@property (nonatomic ,copy) NSString *name;

@end
