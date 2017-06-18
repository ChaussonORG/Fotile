//
//  FTProductService.m
//  FoliteDB
//
//  Created by Chausson on 2017/6/18.
//  Copyright © 2017年 Chausson. All rights reserved.
//

#import "FTProductService.h"
#import "FTDataOperation.h"
#import "FTImageManager.h"
@implementation FTProductService
+ (NSArray <FTProduct *>*)fetchProductsWithRealKitchenId:(NSString *)identifier{
    FMDatabase *db = [[FTDataOperation shareInstance] dataBase];
    
    NSMutableArray <FTProduct *>*products = [NSMutableArray array];
    
    BOOL isGoodConnection = [db goodConnection];
    if (!isGoodConnection) {
        [db open];
    }
    NSString *sql = [NSString stringWithFormat:@"select * from t_real_kitchen_product where kitchen_id = '%@'",identifier];
    FMResultSet *psRes = [db executeQuery:sql];
    while ([psRes next]) {
        NSString *productId = [psRes stringForColumn:@"product_id"];
        FTProduct *product = [self fetchProductWithId:productId];
        [products addObject:product];
    }
    if (!isGoodConnection) {
        [db close];
    }
    return [products copy];
}
+ (FTProduct *)fetchProductWithId:(NSString *)identifier{
    FMDatabase *db = [[FTDataOperation shareInstance] dataBase];
    NSString *sql = [NSString stringWithFormat:@"select * from t_product where id = '%@'",identifier];
    BOOL isGoodConnection = [db goodConnection];
    if (!isGoodConnection) {
        [db open];
    }
    FMResultSet *r = [db executeQuery:sql];

    FTProduct *product = [[FTProduct alloc]init];

    while ([r next]) {
        product.identifier =  [r stringForColumn:@"id"];
        product.createTime =  [r stringForColumn:@"create_time"];
        product.updateTime =  [r stringForColumn:@"update_time"];
        product.name =  [r stringForColumn:@"name"];
        product.modelNumber =  [r stringForColumn:@"model_no"];
        product.slogan =  [r stringForColumn:@"slogan"];
        product.catalogType =  [r intForColumn:@"catalog_id"];
        product.parameters =  [r stringForColumn:@"parameters"];
        product.thumnailImage = [[FTImageManager shareInstance]fetchImageWithId:[r stringForColumn:@"logo_file_id"]];
    }
    if (!isGoodConnection) {
        [db close];
    }
    return product;
}
@end
