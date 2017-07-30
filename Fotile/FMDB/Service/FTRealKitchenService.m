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
+ (FTRealKitchenList *)fetchTopRealKitchensWithCityId:(NSString *)identifier{
    NSString *sql = @"select * from t_real_kitchen where approval_status = 'Approved' and set_top = 1";
    if (identifier.length > 0) {
        sql = [sql stringByAppendingString:[NSString stringWithFormat:@" and city_id = '%@'",identifier]];
    }
    NSArray<FTRealKitchen *> *realKitchens = [self fetchRealKitchensWithSQL:sql];
    NSMutableArray <FTRealKitchen *>*list = [NSMutableArray array];
    FTRealKitchenList *topList = [[FTRealKitchenList alloc]init];
    topList.city = @"本地";
    topList.name = @"推荐";
    for (FTRealKitchen *kitchen in realKitchens) {
        [list addObject:kitchen];
        
    }
    topList.list = list;
    return topList;
}
+ (NSArray <FTRealKitchenList*>*)fetchRealKitchensWithCityId:(NSString *)identifier{
    NSString *sql = @"select * from t_real_kitchen where approval_status = 'Approved'";
    if (identifier.length > 0) {
        sql = [sql stringByAppendingString:[NSString stringWithFormat:@" and city_id = '%@'",identifier]];
    }
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
+ (NSArray <FTRealKitchenList*>*)fetchRealKitchensWithCityId:(NSString *)identifier
                                               productNumber:(NSString *)number
                                                 kitchenArea:(NSString *)area
                                                  fotileCost:(NSString *)cost
                                                 betweenCost:(NSString *)price{

    NSString *sql = @"select * from t_real_kitchen where approval_status = 'Approved'";
    if (identifier.length > 0) {
        sql = [sql stringByAppendingString:[NSString stringWithFormat:@" and city_id = '%@' ",identifier]];
    }
    if (cost.length > 0 && price.length > 0) {
  
        sql = [sql stringByAppendingString:[NSString stringWithFormat:@" and kitchen_fotile_cost between '%@' and '%@' ",cost,price]];
    }
    if (area.length > 0) {
       
        sql = [sql stringByAppendingString:[NSString stringWithFormat:@" and  kitchen_area = '%@' ",area]];
    }
    NSArray <FTRealKitchen *>*kitchens = [self fetchRealKitchensWithSQL:sql];
    if(number && number.length > 0){

        NSMutableArray <FTRealKitchen *>*reals = [NSMutableArray array];
        for (FTRealKitchen *k in kitchens) {
            NSArray <FTProduct *>*kp = [FTProductService fetchProductsWithRealKitchenId:k.identifier];
            for (FTProduct *p in kp) {
                if ([p.modelNumber containsString:number]) {
                    [reals addObject:k];
                    continue;
                }
            }
        }
        kitchens = [reals copy];
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
+ (NSArray <FTRealKitchenList*>*)fetchRealKitchensWithCityId:(NSString *)identifier
                                                  estateName:(NSString *)name{
    NSString *sql = [NSString stringWithFormat:@"select * from t_real_kitchen where  estate_name like '%%%@%%' and approval_status = 'Approved'",name];
    
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
        real.districtName =  [r stringForColumn:@"district_name"];

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
