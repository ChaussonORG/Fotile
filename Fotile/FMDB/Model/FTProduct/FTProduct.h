//
//  FTProduct.h
//  FoliteDB
//
//  Created by Chausson on 2017/6/6.
//  Copyright © 2017年 Chausson. All rights reserved.
//

#import "FTObject.h"
#import "FTGroupImage.h"

@interface FTProduct : FTObject
@property (nonatomic ,copy) NSString *name;

@property (nonatomic ,copy) NSString *modelNumber;
@property (nonatomic ,copy) NSString *slogan;

@property (nonatomic ,assign) int catalogType;
@property (nonatomic ,strong) FTGroupImage *groupImage;

@end
