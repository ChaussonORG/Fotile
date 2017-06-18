//
//  FTProduct.h
//  FoliteDB
//
//  Created by Chausson on 2017/6/6.
//  Copyright © 2017年 Chausson. All rights reserved.
//

#import "FTObject.h"
#import "FTImage.h"
#import "FTGroupImage.h"
#import "FTProductParm.h"

@interface FTProduct : FTObject
@property (nonatomic ,copy) NSString *name;
@property (nonatomic ,copy) NSString *modelNumber;
@property (nonatomic ,copy) NSString *slogan;
@property (nonatomic ,copy) NSString *parameters;
@property (nonatomic ,strong) NSArray <FTProductParm *>*parms;

@property (nonatomic ,assign) int catalogType;
@property (nonatomic ,strong) FTGroupImage *groupImage;
@property (nonatomic ,strong) FTImage *thumnailImage;

@end
