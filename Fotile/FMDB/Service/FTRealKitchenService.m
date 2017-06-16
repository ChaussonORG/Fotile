//
//  FTRealKitchenService.m
//  FoliteDB
//
//  Created by Chausson on 2017/6/14.
//  Copyright © 2017年 Chausson. All rights reserved.
//

#import "FTRealKitchenService.h"
#import "FTDataOperation.h"
#import "FTImageManager.h"
@implementation FTRealKitchenService
+ (NSArray<FTRealKitchen *> *)fetchRealKitchens{
    return [self fetchRealKitchensWithSQL:@"select * from t_real_kitchen"];
}
+ (NSArray <FTRealKitchenList*>*)fetchRealKitchensWithCity:(NSString *)name{
    NSString *sql = [NSString stringWithFormat:@"select * from t_real_kitchen where city = '%@'",name];
    NSArray<FTRealKitchen *> *realKitchens = [self fetchRealKitchensWithSQL:sql];
    NSMutableArray <FTRealKitchenList *>*list = [NSMutableArray array];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    for (FTRealKitchen *kitchen in realKitchens) {
        FTRealKitchenList *realKitchens = [[FTRealKitchenList alloc]init];
        realKitchens.city = kitchen.cityName;
        realKitchens.name = kitchen.estateName;
        [dic setObject:realKitchens forKey:kitchen.estateName];
    }
    for (FTRealKitchen *kitchen in realKitchens) {
        [dic enumerateKeysAndObjectsUsingBlock:^(NSString *key, FTRealKitchenList *obj, BOOL * _Nonnull stop) {
            if ([kitchen.estateName isEqualToString:key]) {
                [obj.list addObject:kitchen];
                *stop = YES;
            }
        }];
    }
    [dic enumerateKeysAndObjectsUsingBlock:^(NSString *key, FTRealKitchenList *obj, BOOL * _Nonnull stop) {
        [list addObject:obj];
    }];

    return [list copy];
}
+ (NSArray <FTRealKitchen *> *)fetchRealKitchensWithSQL:(NSString *)sql{
    FMDatabase *db = [[FTDataOperation shareInstance] dataBase];
    FTImageManager *manager = [FTImageManager shareInstance];
    
    NSMutableArray <FTRealKitchen *>*list = [NSMutableArray array];
    
    BOOL isGoodConnection = [db goodConnection];
    if (!isGoodConnection) {
        [db open];
    }
    FMResultSet *material = [db executeQuery:sql];
    
    while ([material next]) {
        FTRealKitchen *real = [[FTRealKitchen alloc]init];
        real.identifier =  [material stringForColumn:@"id"];
        real.createTime =  [material stringForColumn:@"create_time"];
        real.updateTime =  [material stringForColumn:@"update_time"];
        real.estateName =  [material stringForColumn:@"estate_name"];
        real.houseType =  [material stringForColumn:@"house_type"];
        real.houseArea =  [material stringForColumn:@"house_area"];
        real.kitchenArea =  [material stringForColumn:@"kitchen_area"];
        real.cityName =  [material stringForColumn:@"city"];
        real.kitchenCost =  [material stringForColumn:@"kitchen_cost"];
        real.thumbnailImage =  [manager fetchImageWithId:[material stringForColumn:@"thumbnail_file_id"]];
        [list addObject:real];
        NSMutableArray <FTImage *>*images = [NSMutableArray array];
        NSString *imagesSql = [NSString stringWithFormat:@"select * from t_real_kitchen_image where kitchen_id= '%@'",real.identifier];
        if (!isGoodConnection) {
            [db open];
        }
        FMResultSet *imagesR = [db executeQuery:imagesSql];
        
        while ([imagesR next]) {
            //根据Real 和 HouseType排序，HouseType为最后一张
            NSString *type = [imagesR stringForColumn:@"image_type"];
            FTImage *image = [manager fetchImageWithId:[imagesR stringForColumn:@"image_file_id"]];
            if ([type isEqualToString:@"HouseType"]) {
                image.sort = 1;
            }
            [images addObject:image];
        }
        real.images = [images copy];
    }
    if (!isGoodConnection) {
        [db close];
    }
    return [list copy];
}
@end
