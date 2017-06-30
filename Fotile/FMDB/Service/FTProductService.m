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
        product.color = [r stringForColumn:@"color"];
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
        product.color = [r stringForColumn:@"color"];
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
    for (int i = 1; i < 10; i++) {
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
+ (NSArray <FTProductCategory *>*)fetchCategoryWithModelNumber:(NSString *)number{
    NSMutableArray <FTProductCategory *>*list = [NSMutableArray array];
    for (int i = 1; i < 10; i++) {
        FTProductCategory *c = [[FTProductCategory alloc]init];
        NSString *sql = [NSString stringWithFormat:@"select * from t_product where catalog_id = '%d' and model_no like '%%%@%%'",i,number];
        c.products = [self fetchProductsWithSQL:sql];
        c.type = i;
        if (c.products.count == 0) {
            continue;
        }
        [list addObject:c];
    }
    
    return [list copy];
}
+ (NSArray <FTProductHL *>*)fetchHeightLightWithId:(NSString *)identifier{
    NSString *sql = [NSString stringWithFormat:@"select * from t_fotile_product_highlight where product_id = '%@'",identifier];
    
    FMDatabase *db = [[FTDataOperation shareInstance] dataBase];

    BOOL isGoodConnection = [db goodConnection];
    if (!isGoodConnection) {
        [db open];
    }
    NSMutableArray <FTProductHL *>*array = [NSMutableArray array];
    FMResultSet *r = [db executeQuery:sql];
    while ([r next]) {
        FTProductHL *h = [[FTProductHL alloc]init];
        h.identifier =  [r stringForColumn:@"id"];
        h.createTime =  [r stringForColumn:@"create_time"];
        h.updateTime =  [r stringForColumn:@"update_time"];
        h.desc =  [r stringForColumn:@"h_desc"];
        h.title =  [r stringForColumn:@"title"];
        h.image = [[FTImageManager shareInstance] fetchImageWithId:[r stringForColumn:@"image_id"]];
        [array addObject:h];
    }
    if (!isGoodConnection) {
        [db close];
    }
    
    return [array copy];
}
+ (FTImage *)fetchInstallImageWithId:(NSString *)identifier{
    NSString *sql = [NSString stringWithFormat:@"select * from t_fotile_product where id = '%@'",identifier];

    FMDatabase *db = [[FTDataOperation shareInstance] dataBase];
    
    BOOL isGoodConnection = [db goodConnection];
    if (!isGoodConnection) {
        [db open];
    }
    FMResultSet *r = [db executeQuery:sql];
    NSString *installId ;
    while ([r next]) {
        installId =  [r stringForColumn:@"install_img_id"];

    }
    if (!isGoodConnection) {
        [db close];
    }
    FTImage *image = [[FTImageManager shareInstance] fetchImageWithId:installId];

    return image;
}
+ (FTProductSeries *)fetchSeriesWithId:(NSString *)identifier{
    NSString *sql = [NSString stringWithFormat:@"select * from t_fotile_package_product where product_id = '%@'",identifier];
    FMDatabase *db = [[FTDataOperation shareInstance] dataBase];
    
    BOOL isGoodConnection = [db goodConnection];
    if (!isGoodConnection) {
        [db open];
    }
    FTProductSeries *series = [[FTProductSeries alloc]init];
    FMResultSet *r = [db executeQuery:sql];
    while ([r next]) {
        series.packageId = [r stringForColumn:@"package_id"];
    }
    if (series.packageId) {
        NSString *pSQL = [NSString stringWithFormat:@"select * from t_fotile_package where id = '%@'",series.packageId];
        FMResultSet *p = [db executeQuery:pSQL];
        while ([p next]) {
            series.name = [p stringForColumn:@"pack_name"];
            series.image = [[FTImageManager shareInstance] fetchImageWithId:[p stringForColumn:@"image_id"]];
        }
        NSString *psSQL = [NSString stringWithFormat:@"select * from t_fotile_package_product where package_id = '%@'",series.packageId];
        FMResultSet *pr = [db executeQuery:psSQL];
        NSMutableArray <FTProduct *>*products = [NSMutableArray array];
        while ([pr next]) {
            FTProduct *product = [self fetchProductWithId:[pr stringForColumn:@"product_id"]];
            if (product.identifier.length > 0) {
                 [products addObject:product];
            }
        }
        series.products = [products copy];
    }
    
    if (!isGoodConnection) {
        [db close];
    }
    return series;
}
+ (NSArray <FTProduct *>*)fetchOthersProductWithId:(NSString *)identifier{
    NSString *sql = [NSString stringWithFormat:@"select * from t_fotile_product_other where product_id = '%@'",identifier];
    NSMutableArray <FTProduct *>*products = [NSMutableArray array];

    FMDatabase *db = [[FTDataOperation shareInstance] dataBase];
    
    BOOL isGoodConnection = [db goodConnection];
    if (!isGoodConnection) {
        [db open];
    }
    FMResultSet *r = [db executeQuery:sql];
    while ([r next]) {
        FTProduct *product = [self fetchProductWithId:[r stringForColumn:@"other_product_id"]];
        if (product.identifier.length > 0) {
            [products addObject:product];
        }
    }
    if (!isGoodConnection) {
        [db close];
    }
    return [products copy];

}
+ (NSArray <FTProduct *>*)fetchMoreProductWithId:(NSString *)identifier{
    NSString *sql = [NSString stringWithFormat:@"select * from t_fotile_product_similar where product_id = '%@'",identifier];
    NSMutableArray <FTProduct *>*products = [NSMutableArray array];

    FMDatabase *db = [[FTDataOperation shareInstance] dataBase];
    
    BOOL isGoodConnection = [db goodConnection];
    if (!isGoodConnection) {
        [db open];
    }
    FMResultSet *r = [db executeQuery:sql];
    while ([r next]) {
        FTProduct *product = [self fetchProductWithId:[r stringForColumn:@"similar_product_id"]];
        if (product) {
            [products addObject:product];
        }
    }
    if (!isGoodConnection) {
        [db close];
    }
    return [products copy];

}
@end
