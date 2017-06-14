//
//  FTMaterial.h
//  FoliteDB
//
//  Created by Chausson on 2017/6/6.
//  Copyright © 2017年 Chausson. All rights reserved.
//

#import "FTObject.h"
#import "FTImage.h"
#import "FTGroupImage.h"

@interface FTMaterial : FTObject
@property (nonatomic ,copy) NSString *name;
@property (nonatomic ,strong) FTImage *thumbnailImage;
@property (nonatomic ,strong) FTGroupImage *groupImage;

@end
