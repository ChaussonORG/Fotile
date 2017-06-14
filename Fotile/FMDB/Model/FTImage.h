//
//  FTImage.h
//  FoliteDB
//
//  Created by Chausson on 2017/6/6.
//  Copyright © 2017年 Chausson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FTObject.h"
@interface FTImage : FTObject

@property (nonatomic ,copy) NSString *fileName;
@property (nonatomic ,copy) NSString *url;
@property (nonatomic ,strong) UIImage *picture;
@property (nonatomic ,assign) int size;

+ (FTImage *)test;


@end
