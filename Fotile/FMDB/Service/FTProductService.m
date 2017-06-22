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
    NSString *sql = [NSString stringWithFormat:@"select * from t_product where id = '%@'",identifier];

    return [self fetchProductWithSQL:sql];
}
+ (NSArray <FTProduct *>*)fetchProductWithModelNumber:(NSString *)number{
    NSString *sql = [NSString stringWithFormat:@"select * from t_product where model_no like '%%%@%%'",number];
    return [self fetchProductsWithSQL:sql];
}
+ (NSArray <FTProduct *>*)fetchProductsWithSQL:(NSString *)sql{
 
    FMDatabase *db = [[FTDataOperation shareInstance] dataBase];
    
    BOOL isGoodConnection = [db goodConnection];
    if (!isGoodConnection) {
        [db open];
    }
    NSMutableArray <FTProduct *>*products = [NSMutableArray array];
    
    FMResultSet *r = [db executeQuery:sql];
    
    
    while ([r next]) {
        FTProduct *product = [[FTProduct alloc]init];
        
        product.identifier =  [r stringForColumn:@"id"];
        product.createTime =  [r stringForColumn:@"create_time"];
        product.updateTime =  [r stringForColumn:@"update_time"];
        product.name =  [r stringForColumn:@"name"];
        product.modelNumber =  [r stringForColumn:@"model_no"];
        product.slogan =  [r stringForColumn:@"slogan"];
        product.catalogType =  [r intForColumn:@"catalog_id"];
        product.parameters =  [r stringForColumn:@"parameters"];
        product.thumnailImage = [[FTImageManager shareInstance]fetchImageWithId:[r stringForColumn:@"logo_file_id"]];
        [products addObject:product];
    }
    if (!isGoodConnection) {
        [db close];
    }
    return [products copy];
}
+ (FTProduct *)fetchProductWithSQL:(NSString *)sql{
    FMDatabase *db = [[FTDataOperation shareInstance] dataBase];
   
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
+ (NSArray <FTProductCategory *>*)fetchAllProductCategory{
    NSMutableArray <FTProductCategory *>*list = [NSMutableArray array];
    for (int i = 1; i < 9; i++) {
        FTProductCategory *c = [[FTProductCategory alloc]init];
        NSString *sql = [NSString stringWithFormat:@"select * from t_product where catalog_id = '%d'",i];
        c.products = [self fetchProductsWithSQL:sql];
        c.type = i;
        if (c.products.count == 0) {
            continue;
        }
        [list addObject:c];
    }
    return [list copy];
 
}
@end
