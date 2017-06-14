//
//  FTGroupImage.h
//  FoliteDB
//
//  Created by Chausson on 2017/6/6.
//  Copyright © 2017年 Chausson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FTImage.h"

@interface FTGroupImage : FTObject
@property (nonatomic ,strong) FTImage *day1;
@property (nonatomic ,strong) FTImage *day2;
@property (nonatomic ,strong) FTImage *day3;
@property (nonatomic ,strong) FTImage *night1;
@property (nonatomic ,strong) FTImage *night2;
@property (nonatomic ,strong) FTImage *night3;

@end
