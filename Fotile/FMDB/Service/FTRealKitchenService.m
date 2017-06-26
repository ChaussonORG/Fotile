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
#import "FTProductService.h"
@implementation FTRealKitchenService
+ (NSArray<FTRealKitchen *> *)fetchRealKitchens{
    return [self fetchRealKitchensWithSQL:@"select * from t_real_kitchen"];
}
+ (NSArray <FTRealKitchenList*>*)fetchRealKitchensWithCity:(NSString *)name{
    NSString *sql = [NSString stringWithFormat:@"select * from t_real_kitchen where city = '%@' and approval_status = 'Approved'",name];
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
+ (NSArray <FTRealKitchenList*>*)fetchRealKitchensWithCityName:(NSString *)name
                                                 productNumber:(NSString *)number
                                                   kitchenArea:(NSString *)area
                                                    fotileCost:(NSString *)cost
                                                   betweenCost:(NSString *)price{
    NSString *sql = [NSString stringWithFormat:@"select * from t_real_kitchen where city = '%@' and  kitchen_area = '%@' and kitchen_fotile_cost between '%@' and '%@' ",name,area,cost,price];
    NSArray <FTRealKitchen *>*kitchens = [self fetchRealKitchensWithSQL:sql];
    NSArray <FTProduct *>*products = [FTProductService fetchProductWithModelNumber:number];
    NSMutableArray <FTRealKitchen *>*reals = [NSMutableArray array];
    for (FTRealKitchen *k in kitchens) {
        for (FTProduct *p in products) {
            if ([p.modelNumber containsString:number]) {
                [reals addObject:k];
                continue;
            }
        }
    }
    
    NSMutableArray <FTRealKitchenList *>*list = [NSMutableArray array];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    for (FTRealKitchen *kitchen in kitchens) {
        FTRealKitchenList *realKitchens = [[FTRealKitchenList alloc]init];
        realKitchens.city = kitchen.cityName;
        realKitchens.name = kitchen.estateName;
        [dic setObject:realKitchens forKey:kitchen.estateName];
    }
    for (FTRealKitchen *kitchen in kitchens) {
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
+ (NSArray <FTRealKitchenList*>*)fetchRealKitchensWithCity:(NSString *)city
                                                estateName:(NSString *)name{
    NSString *sql = [NSString stringWithFormat:@"select * from t_real_kitchen where city = '%@' and estate_name like '%%%@%%'",city,name];
    return [self fetchRealKitchenListWithSQL:sql];
}
+ (NSArray <FTRealKitchenList*>*)fetchRealKitchenListWithSQL:(NSString *)sql{
    
    NSArray <FTRealKitchen *>*kitchens = [self fetchRealKitchensWithSQL:sql];
   
    
    NSMutableArray <FTRealKitchenList *>*list = [NSMutableArray array];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    for (FTRealKitchen *kitchen in kitchens) {
        FTRealKitchenList *realKitchens = [[FTRealKitchenList alloc]init];
        realKitchens.city = kitchen.cityName;
        realKitchens.name = kitchen.estateName;
        [dic setObject:realKitchens forKey:kitchen.estateName];
    }
    for (FTRealKitchen *kitchen in kitchens) {
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
    FMResultSet *r = [db executeQuery:sql];
    
    while ([r next]) {
        FTRealKitchen *real = [[FTRealKitchen alloc]init];
        real.identifier =  [r stringForColumn:@"id"];
        real.createTime =  [r stringForColumn:@"create_time"];
        real.updateTime =  [r stringForColumn:@"update_time"];
        real.estateName =  [r stringForColumn:@"estate_name"];
        real.houseType =  [r stringForColumn:@"house_type"];
        real.houseArea =  [r stringForColumn:@"house_area"];
        real.kitchenArea =  [r stringForColumn:@"kitchen_area"];
        real.cityName =  [r stringForColumn:@"city"];
        int kitchenCost = [r intForColumn:@"kitchen_cost"];
        int kitchenFotileCost = [r intForColumn:@"kitchen_fotile_cost"];
        if (kitchenCost > 1000) {
            real.kitchenCost = [self convertCostWithInt:kitchenCost];
        }else{
            real.kitchenCost =  [r stringForColumn:@"kitchen_cost"];
        }
        if (kitchenFotileCost > 1000) {
            real.fotileCost = [self convertCostWithInt:kitchenFotileCost];
        }else{
            real.fotileCost =  [r stringForColumn:@"kitchen_fotile_cost"];
        }
        real.thumbnailImage =  [manager fetchImageWithId:[r stringForColumn:@"thumbnail_file_id"]];
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
+ (NSString *)convertCostWithInt:(int)n{
    int unitPlace = n / 1 % 10;
    int tenPlace = n / 10 % 10;
    int hundredPlace = n / 100 % 10;
    int thousandPlace = n / 1000 % 10;
    if (unitPlace+tenPlace*10+hundredPlace*100 >= 500) {
        thousandPlace+=1;
    }
    return [NSString stringWithFormat:@"%d.%d",n/10000,thousandPlace];
}
@end
