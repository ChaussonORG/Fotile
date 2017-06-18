//
//  FTRealKitchen.h
//  FoliteDB
//
//  Created by Chausson on 2017/6/14.
//  Copyright © 2017年 Chausson. All rights reserved.
//

#import "FTObject.h"
#import "FTImage.h"
@interface FTRealKitchen : FTObject
@property (nonatomic ,copy) NSString *estateName; //小区名称
@property (nonatomic ,copy) NSString *cityName; //城市名
@property (nonatomic ,copy) NSString *houseType; //房型
@property (nonatomic ,copy) NSString *houseArea; //房型面积
@property (nonatomic ,copy) NSString *kitchenArea; //厨房面积
@property (nonatomic ,copy) NSString *kitchenCost; //厨房装修成本
@property (nonatomic ,copy) NSString *fotileCost; //方太厨电价格

@property (nonatomic ,strong) FTImage *thumbnailImage; //缩略图
@property (nonatomic ,strong) NSArray <FTImage *>*images;

@end
