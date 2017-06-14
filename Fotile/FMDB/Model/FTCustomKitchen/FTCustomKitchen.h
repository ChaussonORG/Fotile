//
//  FTCustomKitchen.h
//  FoliteDB
//
//  Created by Chausson on 2017/6/6.
//  Copyright © 2017年 Chausson. All rights reserved.
//

#import "FTObject.h"
#import "FTImage.h"
@interface FTCustomKitchen : FTObject
@property (nonatomic ,copy) NSString *thumbnailImageId;
@property (nonatomic ,copy) NSString *groupImageId;
@property (nonatomic ,copy) NSString *name;
@property (nonatomic ,copy) NSString *tag1;
@property (nonatomic ,copy) NSString *tag2;
@property (nonatomic ,strong) FTImage *image;

@end
