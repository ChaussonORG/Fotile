//
//  FTCustomKTDetail.h
//  FoliteDB
//
//  Created by Chausson on 2017/6/6.
//  Copyright © 2017年 Chausson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FTGroupImage.h"
#import "FTMaterial.h"
#import "FTProduct.h"

@interface FTCustomKTDetail : NSObject

@property (nonatomic ,strong) FTGroupImage *groupImage;
@property (nonatomic ,strong) NSArray <FTMaterial *>*materials;
@property (nonatomic ,strong) NSArray <FTProduct *>*products;
@property (nonatomic ,assign) BOOL hasNight;

@end
